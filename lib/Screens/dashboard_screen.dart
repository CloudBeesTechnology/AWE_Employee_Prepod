import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:awe_project/globals/employe_table.dart';
import 'package:aws_ses_api/email-2010-12-01.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:awe_project/Components/helper_class.dart';
import 'package:awe_project/Screens/change_password_screen.dart';
import 'package:awe_project/globals/my_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../models/EmailNotifi.dart';
import '../models/EmpLeaveDetails.dart';
import '../models/EmpPersonalInfo.dart';
import '../models/EmpWorkInfo.dart';
import '../models/LeaveStatus.dart';
import '../models/TicketRequest.dart';
import 'apply_leave_screen.dart';
import 'login_screen.dart';


class DashBoardScreeen extends StatefulWidget {
  @override
  State<DashBoardScreeen> createState() => _DashBoardScreeenState();
}

class _DashBoardScreeenState extends State<DashBoardScreeen> {

  //NAV BAR METHODS
  DateTime now = DateTime.now(); // Get the current date and time
  String formattedDate = DateFormat(' dd/MM/yyyy    HH:mm:ss').format(DateTime.now());

  // late  int notificationCount;
  final TextEditingController userIdController = TextEditingController();
  final box = GetStorage();

  String employeeName ='';
  String employeeEmail='' ;
  String contactNo='';
  String badgeno='' ;
  String image='' ;
  String empType ='';
  String  department='';
  String Positions ='';
  String doj ='';

  String manager ='';
  String supervisor ='';
  String hr ='';

  String managerEmail ='';
  String supervisorEmail ='';
  String hrEmail ='';

  String managerEmpId ='';
  String supervisorEmpId ='';

  String message='';

  int unreadMessages = 0; // Number of unread messages
  List<Map<String, String>> messageList = [];
  String selectedMessage = '';

  //leaves
  String annualLeave = '0';
  String sickLeave = '0';
  String compasLeave = '';
  String mrageLeave = '';
  String paterLeave = '';
  String materLeave = '';

  bool isStatusUpdated = false;

//profile photo update
  String? fileName;
  Future<void> uploadImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: false,
      allowedExtensions: ['jpg', 'png', 'gif'],
    );

    if (result == null) {
      safePrint('No file selected');
      return;
    }

    final platformFile = result.files.single;
    setState(() {
      fileName = platformFile.name;
    });

    try {
      final uploadResult = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          platformFile.readStream!,
          size: platformFile.size,
        ),
        path: StoragePath.fromString('uploadProfilePhoto/${platformFile.name}'),
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;

      final imageUrl = uploadResult.uploadedItem.path;
      safePrint('Successfully uploaded: $imageUrl');

      await updateProfilePhotoURL(imageUrl);
    } on StorageException catch (e) {
      safePrint(e.message);
      _showErrorDialog(context, "Failed to upload image.");
    }
  }

  Future<void> updateProfilePhotoURL(String imageUrl) async {
    final box = GetStorage();
    final empId = box.read('userId') ?? '';

    if (empId.isEmpty) {
      safePrint("Invalid empId.");
      return;
    }

    try {
      String baseUrl = "https://aweadininstorage20242a2fe-dev.s3.ap-southeast-1.amazonaws.com/";
      String fullUrl = "$baseUrl$imageUrl";

      final request = ModelQueries.list(
        EmpPersonalInfo.classType,
        where: EmpPersonalInfo.EMPID.eq(empId),
      );

      final response = await Amplify.API.query(request: request).response;

      if (response.data?.items.isNotEmpty == true) {
        EmpPersonalInfo existingEmployee = response.data!.items.first!;
        EmpPersonalInfo updatedEmployee = existingEmployee.copyWith(profilePhoto: fullUrl);

        await Amplify.API.mutate(
          request: ModelMutations.update(updatedEmployee),
        ).response;

        box.write('image', fullUrl);
        setState(() {
          image = fullUrl;
        });

        safePrint("Profile photo updated successfully.");
      } else {
        safePrint("Employee not found with empId: $empId");
        _showErrorDialog(context, "Employee not found.");
      }
    } catch (e) {
      safePrint("Failed to update profile photo: $e");
      _showErrorDialog(context, "Failed to update profile photo.");
    }
  }


  //contact no update
  Future<void> _updateEmployeeInfo( BuildContext context, String empId, String name,   String contactNo,  String email,
      {String? dob, String? empBadgeNo, String? empType}) async {
    try {
      // Fetch the current employee data from the API
      final request = ModelQueries.list(EmpPersonalInfo.classType);
      final response = await Amplify.API.query(request: request).response;

      if (response.errors.isNotEmpty) {
        print('Error fetching employee data: ${response.errors}');
        return;
      }

      List<EmpPersonalInfo?> employeeInfos = response.data?.items ?? [];
      EmpPersonalInfo? employeeInfo = employeeInfos.firstWhere(
            (e) => e?.empID == empId,
        orElse: () => null,
      );

      if (employeeInfo != null) {
        // Prepare the updated info object
        EmpPersonalInfo updatedInfo = employeeInfo.copyWith(
          name: name,
          email: email,
          contactNo: contactNo.isNotEmpty ? [contactNo] : employeeInfo.contactNo,
          empBadgeNo: empBadgeNo ?? employeeInfo.empBadgeNo,
          empType: empType!.isNotEmpty ? [empType] : employeeInfo.empType,
          dob: dob ?? employeeInfo.dob, // Only update if dob is provided
        );


        // Use ModelMutations to update the data in the database
        final request = ModelMutations.update(updatedInfo);
        final response = await Amplify.API.mutate(request: request).response;
        print(response);

        if (response.errors.isNotEmpty) {
          print('Error updating employee info: ${response.errors}');
          _showErrorDialog(context, 'Failed to update employee info.');
        } else {
          print('Personal info edited successfully!');
          _showAlertDialog('Success', 'Personal info edited successfully.');
        }
      } else {
        // _showErrorDialog(context, 'Employee not found.');
      }
    } catch (e) {
      print('Error updating employee info: $e');
      // _showErrorDialog(context, 'An unexpected error occurred.');
    }
  }

  Future<void> fetchUpdatedEmployeeInfo(BuildContext context) async {
    String empId = GetStorage().read('userId'); // Retrieve empId from storage

    if (empId != null && empId.isNotEmpty) {
      // Fetch employee personal info and update local variables
      final request = ModelQueries.list(EmpPersonalInfo.classType);
      final response = await Amplify.API.query(request: request).response;

      if (response.errors.isNotEmpty) {
        _showErrorDialog(context, 'Failed to fetch employee info.');
        return;
      }

      List<EmpPersonalInfo?> employeeInfos = response.data?.items ?? [];
      EmpPersonalInfo? employeeInfo = employeeInfos.firstWhere(
            (e) => e?.empID == empId,
        orElse: () => null,
      );

      if (employeeInfo != null) {
        // Update local variables and storage
        setState(() {
          employeeName = employeeInfo.name ?? 'N/A';
          employeeEmail = employeeInfo.email ?? 'N/A';
          contactNo = (employeeInfo.contactNo != null && employeeInfo.contactNo!.isNotEmpty)
              ? employeeInfo.contactNo!.first
              : 'N/A'; // Take the first element if it exists, otherwise 'N/A'
          position = (employeeInfo.position != null && employeeInfo.position!.isNotEmpty)
              ? employeeInfo.position!.first
              : 'N/A'; // Take the first element if it exists, otherwise 'N/A'
          image = employeeInfo.profilePhoto ?? 'N/A';
        });
        box.write('image', image);
      }
      else {
        // _showErrorDialog(context, 'Employee not found.');
      }
    } else {
      // _showErrorDialog(context, 'Employee ID not found.');
    }
  }

  //Sign out
  Future<void> _confirmSignOut(BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Log Out'),
        content: Text('Are you sure you want to Log out?'),
        actions: <Widget>[
          TextButton(
            child: Text('No',style: TextStyle(color: Colors.red),),
            onPressed: () {
              Navigator.of(ctx).pop(); // Just close the dialog
            },
          ),
          TextButton(
            child: Text('Yes',style: TextStyle(color: Colors.green),),
            onPressed: () async {
              Navigator.of(ctx).pop(); // Close the dialog before signing out
              await _signOut(); // Call the sign out method
            },
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await Amplify.Auth.signOut();
      final box = GetStorage();
      // Clear all stored data in GetStorage
      await box.erase();

      // Navigate to login screen
      Get.off(() => LoginScreen());
    } catch (e) {
      print('Error logging out: $e');
    }
  }


  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }



  //profile popup
  void _showPopupMenu(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(100, 70, 5, 300), // Position of the menu
      items: [
        PopupMenuItem<int>(
          value: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height:size.height * 0.010,),
              Container(
                height: size.height * 0.070,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: image.isNotEmpty
                          ? NetworkImage(image) // Use NetworkImage for URLs
                          : null, // Set to null to use the default child
                      radius: 25,
                      child: image.isEmpty // Check if the image URL is empty
                          ? Icon(Icons.person, size: 24) // Fallback icon if no image
                          : null, // No child needed if the image is available
                    ),
                    Positioned(
                      top: size.height * 0.048,
                      bottom: 0.35,
                      right: size.width * 0.0019,
                      child: GestureDetector(
                        onTap: () {
                          uploadImage();
                        },
                        child: Container(
                          width: size.width * 0.025,
                          height: size.height * 0.01,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Adjust to your defined pink
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Icon(
                            Icons.photo_camera_outlined,
                            color: Colors.black, // Adjust to your defined black
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:size.height * 0.005,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height:size.height * 0.030,
                        padding: EdgeInsets.only(left: 12),
                        child:Text('Personal Info',
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontStyle: FontStyle.normal),)
                    ),
                    SizedBox(width:size.width * 0.060,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        _showEditDialog(context);

                      },
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Edit',
                                style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                // Use GestureRecognizer to detect taps
                              ),
                            ]),),
                    )]),
              SizedBox(height:size.height * 0.007,),
              Divider(
                thickness: 1.5,
                color: Colors.black45,
              ),
              SizedBox(height:size.height * 0.003,),
              Container(
                height:size.height * 0.040,
                width:size.width * 0.270,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(5), // Optional: rounded corners
                ),

                child: Row(
                    children: [
                      SizedBox(width:size.width * 0.015,),
                      Text(employeeName,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black87),),]),
              ),
              SizedBox(height:size.height * 0.010,),
              Container(
                height:size.height * 0.040,
                width:size.width * 0.270,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(5), // Optional: rounded corners
                ),
                child: Row(children: [
                  SizedBox(width:size.width * 0.015,),
                  Text(
                    contactNo,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black87),),
                ]),),
              SizedBox(height:size.height * 0.010,),
              Container(
                height:size.height * 0.040,
                width:size.width * 0.270,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(5), // Optional: rounded corners
                ),
                child:Row(children: [
                  SizedBox(width:size.width * 0.015,),
                  Text(
                    employeeEmail,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black87),
                  ),
                ]),),

              SizedBox(height:size.height * 0.010),
              Row(
                  children: [
                    Container(
                      height:size.height * 0.040,
                      width:size.width * 0.085,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => changePasswordScreen(username: userIdController.text.trim()));
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(color: Colors.yellow, width: 3), // Change border color and width
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Rounded corners
                            ),
                          ),
                        ),
                        child: Text('Change Password',style: TextStyle(
                            fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black)),
                      ),
                    ),
                    SizedBox(width:size.width * 0.010,),
                    Container(
                      height:size.height * 0.038,
                      width:size.height * 0.150,
                      child: TextButton(
                        onPressed: () {
                          _confirmSignOut(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(5), // Rounded corners
                          ),
                        ),
                        child: Row(
                            children: [
                              SizedBox(width:size.width * 0.015,) ,
                              Text('Logout',style: TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black)),
                              SizedBox(width:size.width * 0.005,) ,
                              Icon(Icons.logout_outlined,size: 15,color: black,),
                            ]),
                      ),),
                    SizedBox(height: 50)
                  ]),
            ],
          ),
        ),
      ],
    );
  }

  void _tabPopupMenu(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(100, 70, 5, 300), // Position of the menu
      items: [
        PopupMenuItem<int>(
          value: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height:size.height * 0.010,),
              Container(
                height: size.height * 0.070,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: image.isNotEmpty
                          ? NetworkImage(image) // Use NetworkImage for URLs
                          : null, // Set to null to use the default child
                      radius: 25,
                      child: image.isEmpty // Check if the image URL is empty
                          ? Icon(Icons.person, size: 24) // Fallback icon if no image
                          : null, // No child needed if the image is available
                    ),
                    Positioned(
                      top: size.height * 0.048,
                      bottom: 0.35,
                      right: size.width * 0.0019,
                      child: GestureDetector(
                        onTap: () {
                          uploadImage();
                        },
                        child: Container(
                          width: size.width * 0.025,
                          height: size.height * 0.01,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Adjust to your defined pink
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Icon(
                            Icons.photo_camera_outlined,
                            color: Colors.black, // Adjust to your defined black
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height:size.height * 0.005,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height:size.height * 0.030,
                        padding: EdgeInsets.only(left: 12),
                        child:Text('Personal Info',
                          style: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontStyle: FontStyle.normal),)
                    ),
                    SizedBox(width:size.width * 0.090,),
                    GestureDetector(
                      onTap: (){
                        _tabEditDialog(context);
                      },
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Edit',
                                style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                // Use GestureRecognizer to detect taps
                              ),
                            ]),),
                    )]),
              SizedBox(height:size.height * 0.007,),
              Divider(
                thickness: 1.5,
                color: Colors.black45,
              ),
              SizedBox(height:size.height * 0.003,),
              Container(
                height:size.height * 0.036,
                width:size.width * 0.220,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(5), // Optional: rounded corners
                ),

                child: Row(
                    children: [
                      SizedBox(width:size.width * 0.015,),
                      Text(employeeName.isNotEmpty?employeeName :'N/A',
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black87),),]),
              ),
              SizedBox(height:size.height * 0.010,),
              Container(
                height:size.height * 0.036,
                width:size.width * 0.220,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(5), // Optional: rounded corners
                ),
                child: Row(children: [
                  SizedBox(width:size.width * 0.015,),
                  Text(
                    contactNo.isNotEmpty?contactNo :'N/A',
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black87),),
                ]),),
              SizedBox(height:size.height * 0.010,),
              Container(
                height:size.height * 0.036,
                width:size.width * 0.220,
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1, // Border width
                  ),
                  borderRadius: BorderRadius.circular(5), // Optional: rounded corners
                ),
                child:Row(children: [
                  SizedBox(width:size.width * 0.015,),
                  Text(
                    employeeEmail.isNotEmpty?employeeEmail : 'N/A',
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black87),
                  ),
                ]),),

              SizedBox(height:size.height * 0.010),
              Row(
                  children: [
                    Container(
                      height:size.height * 0.038,
                      width:size.width * 0.125,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => changePasswordScreen(username: userIdController.text.trim()));
                        },
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(color: Colors.yellow, width: 3), // Change border color and width
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Rounded corners
                            ),
                          ),
                        ),
                        child: Text('Change Password',style: TextStyle(
                            fontSize: 9.5,fontWeight: FontWeight.bold,color: Colors.black)),
                      ),
                    ),
                    SizedBox(width:size.width * 0.010,),
                    Container(
                      height:size.height * 0.037,
                      width:size.height * 0.150,
                      child: TextButton(
                        onPressed: () {
                          _confirmSignOut(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(5), // Rounded corners
                          ),
                        ),
                        child: Row(
                            children: [
                              SizedBox(width:size.width * 0.015,) ,
                              Text('Logout',style: TextStyle(
                                  fontSize: 11,fontWeight: FontWeight.bold,color: Colors.black)),
                              SizedBox(width:size.width * 0.005,) ,
                              Icon(Icons.logout_outlined,size: 15,color: black,),
                            ]),
                      ),),
                    SizedBox(height: 50)
                  ]),
            ],
          ),
        ),
      ],
    );
  }

  void _phonePopupMenu(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(100, 70, 9, 300), // Position of the menu
      items: [
        PopupMenuItem<int>(
          value: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height * 0.010,
              ),
              Container(
                height: size.height * 0.070,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: image.isNotEmpty
                          ? NetworkImage(image) // Use NetworkImage for URLs
                          : null, // Set to null to use the default child
                      radius: 30,
                      child: image.isEmpty // Check if the image URL is empty
                          ? Icon(Icons.person, size: 20) // Fallback icon if no image
                          : null, // No child needed if the image is available
                    ),
                    Positioned(
                      top: size.height * 0.048,
                      bottom: 0,
                      right: size.width * 0.015,
                      child: GestureDetector(
                        onTap: () {
                          uploadImage();
                        },
                        child: Container(
                          width: size.width * 0.060,
                          height: size.height * 0.01,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pink,
                            border: Border.all(color: white, width: 1),
                          ),
                          child: Icon(
                            Icons.photo_camera_outlined,
                            color: black,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Row(children: [
                SizedBox(
                  width: size.width * 0.020,
                ),
                Container(
                    height: size.height * 0.020,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Personal Info',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          fontStyle: FontStyle.normal),
                    )),
                SizedBox(
                  width: size.width * 0.20,
                ),
                GestureDetector(
                  onTap: () {
                    _phoneEditDialog(context);
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Edit',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        // Use GestureRecognizer to detect taps
                      ),
                    ]),
                  ),
                )
              ]),
              SizedBox(
                height: size.height * 0.005,
              ),
              Divider(
                thickness: 1.5,
                color: Colors.black45,
              ),
              SizedBox(
                height: size.height * 0.003,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.035,
                  ),
                  Container(
                    height: size.height * 0.034,
                    width: size.width * 0.53,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the container
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1, // Border width
                      ),
                      borderRadius:
                      BorderRadius.circular(5), // Optional: rounded corners
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      Text(
                        employeeName,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.035,
                  ),
                  Container(
                    height: size.height * 0.034,
                    width: size.width * 0.53,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the container
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1, // Border width
                      ),
                      borderRadius:
                      BorderRadius.circular(5), // Optional: rounded corners
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      Text(
                        contactNo,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.035,
                  ),
                  Container(
                    height: size.height * 0.034,
                    width: size.width * 0.53,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the container
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1, // Border width
                      ),
                      borderRadius:
                      BorderRadius.circular(5), // Optional: rounded corners
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: size.width * 0.025,
                      ),
                      Text(
                        employeeEmail,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.010),
              Row(children: [
                SizedBox(
                  width: size.width * 0.03,
                ),
                Container(
                  height: size.height * 0.040,
                  width: size.width * 0.290,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => changePasswordScreen(
                          username: userIdController.text.trim()));
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(
                            color: Colors.yellow,
                            width: 3), // Change border color and width
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(5), // Rounded corners
                        ),
                      ),
                    ),
                    child: Text('Change Password',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.019,
                ),
                Container(
                  height: size.height * 0.037,
                  width: size.width * 0.230,
                  child: TextButton(
                    onPressed: () {
                      _confirmSignOut(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Rounded corners
                      ),
                    ),
                    child: Row(children: [
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text('Logout',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Icon(
                        Icons.logout_outlined,
                        size: 15,
                        color: black,
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 60)
              ]),
            ],
          ),
        ),
      ],
    );
  }

  //profile edit
  void _showEditDialog(BuildContext context) {
    String? empId = GetStorage().read('userId'); // Get the empId from storage

    if (empId == null || empId.isEmpty) {
      _showErrorDialog(context, 'Employee ID not found.');
      return;
    }

    // Initialize the TextEditingControllers with the latest employee data
    TextEditingController fullName = TextEditingController(text: employeeName.isNotEmpty ? employeeName:'N/A');
    TextEditingController email = TextEditingController(text: employeeEmail.isNotEmpty ? employeeEmail : 'N/A');
    TextEditingController mobile = TextEditingController(text: contactNo.isNotEmpty ? contactNo : 'N/A');

    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(8),
          width: size.width * 0.410,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.025),
                  Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: size.width * 0.230),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined, size: 25, color: Colors.black),
                  )
                ],
              ),
              Divider(),
              SizedBox(height: size.height * 0.012),
              // Full Name Field
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080),
                  Text('Full Name', style: TextStyle(fontSize: 14)),
                ],
              ),
              SizedBox(height: size.height * 0.007),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080),
                  newContainer(context, fullName, 'Full name', 16,readOnly: true),
                ],
              ),
              SizedBox(height: size.height * 0.020),
              // Mobile Number Field
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080),
                  Text('Mobile Number', style: TextStyle(fontSize: 14)),
                ],
              ),
              SizedBox(height: size.height * 0.007),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080),
                  newContainer(context, mobile, 'Mobile Number', 16),
                ],
              ),
              SizedBox(height: size.height * 0.020),
              // Email Address Field
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080),
                  Text('Email Address', style: TextStyle(fontSize: 14)),
                ],
              ),
              SizedBox(height: size.height * 0.007),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080),
                  newContainer(context, email, 'Email address', 16,readOnly: true),
                ],
              ),
              SizedBox(height: size.height * 0.040),
              // Save Button
              MaterialButton(
                minWidth: size.width * .06,
                height: size.height * 0.03,
                onPressed: () async {
                  Navigator.pop(context);
                  await _updateEmployeeInfo(
                    context,
                    empId, // Pass empId
                    fullName.text,
                    mobile.text,
                    email.text,
                  );
                  await fetchUpdatedEmployeeInfo(context);
                  _showAlertDialog('Success', 'Personal info Edited successfully.');
                  Get.back();
                  // Close the dialog
                },
                child: Text('Save', style: TextStyle(fontSize: 16, fontFamily: 'Inter')),
                color: Colors.yellow,
                textColor: Colors.black,
              ),
              SizedBox(height: size.height * 0.020),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _tabEditDialog(BuildContext context) {
    String? empId = GetStorage().read('userId'); // Get the empId from storage

    if (empId == null || empId.isEmpty) {
      _showErrorDialog(context, 'Employee ID not found.');
      return;
    }

    // Initialize the TextEditingControllers with the latest employee data
    TextEditingController fullName = TextEditingController(text: employeeName.isNotEmpty ? employeeName:'N/A');
    TextEditingController email = TextEditingController(text: employeeEmail.isNotEmpty ? employeeEmail : 'N/A');
    TextEditingController mobile = TextEditingController(text: contactNo.isNotEmpty ? contactNo : 'N/A');

    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(8),
          width:  size.width * 0.415,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width * 0.025,),
                  Text(
                    "Personal Information",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: size.width * 0.190,),
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.cancel_outlined,size: 23,color: black,))
                ],
              ),
              Divider(),
              SizedBox(height: size.height * 0.012,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.08,),
                  Text('Full Name', style: TextStyle(fontSize: 14)),
                  SizedBox(width: size.width * 0.093,),
                ],
              ),
              SizedBox(height: size.height * 0.007,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width* 0.080,),
                  newContainer(context, fullName,'Full name',12,readOnly: true),

                ],
              ),
              SizedBox(height:size.height * 0.020,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080,),
                  Text('Mobile Number', style: TextStyle(fontSize: 14)),
                ],
              ),
              SizedBox(height: size.height *0.007,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080,),
                  newContainer(context, mobile,'Mobile number',12)
                ],
              ),
              SizedBox(height:size.height * 0.020,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080,),
                  Text('Email Address', style: TextStyle(fontSize: 14)),
                ],
              ),
              SizedBox(height: size.height *0.007,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * 0.080,),
                  newContainer(context, email,'Email address',12,readOnly: true)
                ],
              ),
              SizedBox(height:size.height * 0.040,),
              MaterialButton(
                minWidth: size.width * .06,
                height: size.height * 0.03,
                onPressed: () {
                  Get.back(); // Close the dialog
                },
                child: Text('Save',style: TextStyle(fontSize: 16,fontFamily: 'Inter',),),
                color: Colors.yellow,
                textColor: Colors.black,
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
    );
  }

  void _phoneEditDialog(BuildContext context) {
    String? empId = GetStorage().read('userId'); // Get the empId from storage

    if (empId == null || empId.isEmpty) {
      _showErrorDialog(context, 'Employee ID not found.');
      return;
    }

    // Initialize the TextEditingControllers with the latest employee data
    TextEditingController fullName = TextEditingController(text: employeeName.isNotEmpty ? employeeName:'N/A');
    TextEditingController email = TextEditingController(text: employeeEmail.isNotEmpty ? employeeEmail : 'N/A');
    TextEditingController mobile = TextEditingController(text: contactNo.isNotEmpty ? contactNo : 'N/A');

    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          //height: size.height * 0.45,
          width: size.width * 0.76,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.039,
                  ),
                  Text(
                    "Personal Information",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 23,
                        color: black,
                      ))
                ],
              ),
              Divider(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.088,
                  ),
                  Text('Full Name',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54)),
                  SizedBox(
                    width: size.width * 0.023,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.008,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.088,
                  ),
                  phonePopContainer(context, fullName, ' ', 11, readonly: true),
                  // myContainer(context, lastName),
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.088,
                  ),
                  Text('Mobile Number',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54)),
                ],
              ),
              SizedBox(
                height: size.height * 0.007,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.089,
                  ),
                  phonePopContainer(context, mobile, 'Mobile Number', 11)
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.088,
                  ),
                  Text('Email Address',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54)),
                ],
              ),
              SizedBox(
                height: size.height * 0.007,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.088,
                  ),
                  phonePopContainer(context, email, '', 11, readonly: true)
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.30,
                  ),
                  MaterialButton(
                    minWidth: size.width * .09,
                    height: size.height * 0.03,
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter',
                      ),
                    ),
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.040,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // Request ticket
  Widget requestContainer(BuildContext context, TextEditingController controller, double width, double height, StateSetter setDialogState) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 10, color: Colors.grey.shade400),
          contentPadding: EdgeInsets.all(5),
          isDense: true, // Make the field more compact
          border: InputBorder.none,
        ),
        textAlignVertical: TextAlignVertical.center,


      ),
    );
  }
  void _requestDialog(BuildContext context) {
    // Define TextEditingControllers for each field
    TextEditingController departure = TextEditingController();
    TextEditingController arrival = TextEditingController();
    TextEditingController destination = TextEditingController();
    TextEditingController remarks = TextEditingController();

    // Define variables to hold error messages for each field
    String? departureError;
    String? arrivalError;
    String? destinationError;
    String? remarksError;

    final Size size = MediaQuery.of(context).size;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            // Function to validate all fields
            void validateFields() {
              setDialogState(() {
                departureError = departure.text.isEmpty ? 'This field is required' : null;
                arrivalError = arrival.text.isEmpty ? 'This field is required' : null;
                destinationError = destination.text.isEmpty ? 'This field is required' : null;
                remarksError = remarks.text.isEmpty ? 'This field is required' : null;
              });
            }

            // Function to clear error when user starts typing
            void clearErrorOnChange(TextEditingController controller, String? errorField, String fieldName) {
              controller.addListener(() {
                setDialogState(() {
                  if (controller.text.isNotEmpty) {
                    switch (fieldName) {
                      case 'departure':
                        departureError = null;
                        break;
                      case 'arrival':
                        arrivalError = null;
                        break;
                      case 'destination':
                        destinationError = null;
                        break;
                      case 'remarks':
                        remarksError = null;
                        break;
                    }
                  }
                });
              });
            }

            // Attach listeners to each field to dynamically clear the error
            clearErrorOnChange(departure, departureError, 'departure');
            clearErrorOnChange(arrival, arrivalError, 'arrival');
            clearErrorOnChange(destination, destinationError, 'destination');
            clearErrorOnChange(remarks, remarksError, 'remarks');

            return Container(
              padding: EdgeInsets.all(8),
              width: size.width * 0.425,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: size.width * 0.165),
                      Text(
                        "Request Ticket",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Inter'),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: size.height * 0.012),
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.45,
                    decoration: BoxDecoration(
                        color: ticket
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.030),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.042,),
                            Text('Departure Date ',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.016,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( departureError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      departureError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.097,
                                  height: size.height * 0.036,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400,width: 1)
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: departure,
                                      style: TextStyle(
                                        fontSize: 11, // Set a smaller font size for the picked date
                                        color: Colors.black, // You can also control the color of the text
                                      ),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 5, bottom: 19),
                                        hintText: 'dd/mm/yy',
                                        hintStyle: TextStyle(fontSize: 11),
                                        suffixIcon: IconButton(
                                          padding: EdgeInsets.only(bottom: 0.5,left: 10),
                                          onPressed: () => _selectedDate(context, departure,true), // Correct the onPressed
                                          icon: Icon(
                                            Icons.calendar_month,
                                            size: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020),

                        // Arrival Date Field with Error
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.042,),
                            Text('Arrival  Date ',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.028,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( arrivalError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      arrivalError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.097,
                                  height: size.height * 0.036,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400,width: 1)
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: arrival,
                                      style: TextStyle(
                                        fontSize: 11, // Set a smaller font size for the picked date
                                        color: Colors.black, // You can also control the color of the text
                                      ),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 5, bottom: 19),
                                        hintText: 'dd/mm/yy',
                                        hintStyle: TextStyle(fontSize: 11),
                                        suffixIcon: IconButton(
                                          padding: EdgeInsets.only(bottom: 0.5,left: 10),
                                          onPressed: () => _selectedDate(context, arrival,false), // Correct the onPressed
                                          icon: Icon(
                                            Icons.calendar_month,
                                            size: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020),

                        // Destination Field with Error
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.042,),
                            Text('Destination',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.034,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( destinationError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      destinationError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                requestContainer(context, destination, size.width * 0.097, size.height * 0.036,setDialogState),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020),

                        // Remarks Field with Error
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.042,),
                            Text('Remarks',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.045,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( remarksError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      remarksError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.170,
                                  height:size.height * 0.075,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey.shade400,width: 1),
                                  ),
                                  child: TextField(
                                    controller: remarks,
                                    style: TextStyle(fontSize: 13),
                                    // contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.010, horizontal: size.width * 0.007),
                                    decoration: InputDecoration(
                                      hintText: 'Text Here',
                                      hintStyle: TextStyle(fontSize: 10,color: Colors.grey.shade400),
                                      contentPadding: EdgeInsets.all(5),
                                      isDense: true, // Make the field more compact
                                      border: InputBorder.none,
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                  ),
                                ),
                              ],
                            ),
                          ],

                        ),
                        SizedBox(height: size.height * 0.035),

                        // Apply and Cancel Buttons
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.125),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: grey), // Outline border color
                                borderRadius: BorderRadius.circular(0), // Adjust the border radius as needed
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                minWidth: size.width * 0.052, // Adjust width as needed
                                height: size.height * 0.043, // Adjust height as needed
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0), // Keep border radius consistent
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.025),
                            MaterialButton(
                              minWidth: size.width * 0.060,
                              height: size.height * 0.046,
                              onPressed: () async {
                                validateFields();
                                if (departureError == null &&
                                    arrivalError == null &&
                                    destinationError == null &&
                                    remarksError == null) {
                                  // Call applyTicketRequest function directly
                                  await applyTicketRequest(departure.text, arrival.text, destination.text, remarks.text);
                                }
                              },
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _tabrequestDialog(BuildContext context) {
    TextEditingController departure=TextEditingController();
    TextEditingController arrival=TextEditingController();
    TextEditingController destination=TextEditingController();
    TextEditingController remarks=TextEditingController();

    String? departureError;
    String? arrivalError;
    String? destinationError;
    String? remarksError;

    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: StatefulBuilder(
          builder: (BuildContext context,StateSetter setDialogState ){
            void validateFields() {
              setDialogState(() {
                departureError = departure.text.isEmpty ? 'This field is required' : null;
                arrivalError = arrival.text.isEmpty ? 'This field is required' : null;
                destinationError = destination.text.isEmpty ? 'This field is required' : null;
                remarksError = remarks.text.isEmpty ? 'This field is required' : null;
              });
            }

            // Function to clear error when user starts typing
            void clearErrorOnChange(TextEditingController controller, String? errorField, String fieldName) {
              controller.addListener(() {
                setDialogState(() {
                  if (controller.text.isNotEmpty) {
                    switch (fieldName) {
                      case 'departure':
                        departureError = null;
                        break;
                      case 'arrival':
                        arrivalError = null;
                        break;
                      case 'destination':
                        destinationError = null;
                        break;
                      case 'remarks':
                        remarksError = null;
                        break;
                    }
                  }
                });
              });
            }

            // Attach listeners to each field to dynamically clear the error
            clearErrorOnChange(departure, departureError, 'departure');
            clearErrorOnChange(arrival, arrivalError, 'arrival');
            clearErrorOnChange(destination, destinationError, 'destination');
            clearErrorOnChange(remarks, remarksError, 'remarks');
            return Container(
              padding: EdgeInsets.all(8),
              width:  size.width * 0.455,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width * 0.155,),
                      Text(
                        "Request Ticket",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily:  'Inter'),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: size.height * 0.012,),
                  Container(
                    width: size.width * 0.35,
                    height: size.height * 0.43,
                    decoration: BoxDecoration(
                        color: ticket
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.030,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.032,),
                            Text('Departure Date ',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.012,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( departureError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      departureError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.105,
                                  height: size.height * 0.0340,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400,width: 1)
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: departure,
                                      style: TextStyle(
                                        fontSize: 09, // Set a smaller font size for the picked date
                                        color: Colors.black, // You can also control the color of the text
                                      ),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 5, bottom: 19),
                                        hintText: 'dd/mm/yy',
                                        hintStyle: TextStyle(fontSize: 10),
                                        suffixIcon: IconButton(
                                          padding: EdgeInsets.only(bottom: 0.5,left: 10),
                                          onPressed: () => _selectedDate(context, departure,true), // Correct the onPressed
                                          icon: Icon(
                                            Icons.calendar_month,
                                            size: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.030,),
                            Text('Arrival  Date ',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.032,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( arrivalError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      arrivalError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.105,
                                  height: size.height * 0.030,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400,width: 1)
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TextField(
                                      controller: arrival,
                                      style: TextStyle(
                                        fontSize: 09, // Set a smaller font size for the picked date
                                        color: Colors.black, // You can also control the color of the text
                                      ),
                                      textAlignVertical: TextAlignVertical.center,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 5, bottom: 19),
                                        hintText: 'dd/mm/yy',
                                        hintStyle: TextStyle(fontSize: 10),
                                        suffixIcon: IconButton(
                                          padding: EdgeInsets.only(bottom: 0.5,left: 10),
                                          onPressed: () => _selectedDate(context, arrival, false),
                                          // Correct the onPressed
                                          icon: Icon(
                                            Icons.calendar_month,
                                            size: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.030,),
                            Text('Destination',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.040,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( destinationError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      destinationError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                requestContainer(context, destination, size.width * 0.105, size.height * 0.032,setDialogState),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.030,),
                            Text('Remarks',style: TextStyle(color: black,fontSize: 14, fontFamily: 'Inter'),),
                            SizedBox(width: size.width * 0.055,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if ( remarksError!= null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below error message
                                    child: Text(
                                      remarksError!,
                                      style: TextStyle(color: Colors.red, fontSize: 9), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.170,
                                  height:size.height * 0.075,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey.shade400,width: 1),
                                  ),
                                  child: TextField(
                                    controller: remarks,
                                    // contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.010, horizontal: size.width * 0.007),
                                    decoration: InputDecoration(
                                      hintText: 'Text Here',
                                      hintStyle: TextStyle(fontSize: 10,color: Colors.grey.shade400),
                                      contentPadding: EdgeInsets.all(5),
                                      isDense: true, // Make the field more compact
                                      border: InputBorder.none,
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.035,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.125,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: grey), // Outline border color
                                borderRadius: BorderRadius.circular(0), // Adjust the border radius as needed
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                minWidth: size.width * 0.052, // Adjust width as needed
                                height: size.height * 0.043, // Adjust height as needed
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0), // Keep border radius consistent
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.020,),
                            MaterialButton(
                              minWidth: size.width * 0.068,
                              height: size.height * 0.048,
                              onPressed: () {
                                validateFields();
                                if (departureError == null &&
                                    arrivalError == null &&
                                    destinationError == null &&
                                    remarksError == null) {
                                  // Show confirmation dialog before applying
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Confirm ?'),
                                        content: Text('Are you sure you want to apply for the ticket?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context); // Dismiss the dialog immediately
                                            },
                                            child: Text('No', style: TextStyle(color: Colors.red)),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.pop(context); // Close confirmation dialog
                                              // Call applyTicketRequest function and pass inputs
                                              await applyTicketRequest(departure.text, arrival.text, destination.text, remarks.text);

                                            },
                                            child: Text('Yes', style: TextStyle(color: Colors.green)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },

                              child: Text('Apply',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,fontFamily: 'Inter',),),
                              color: Colors.yellow,
                              textColor: Colors.black,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(height:size.height * 0.040,),

                ],
              ),
            );
          },
        ),
      ),
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
    );
  }

  void _phonerequestDialog(BuildContext context) {
    TextEditingController departure = TextEditingController();
    TextEditingController arrival = TextEditingController();
    TextEditingController destination = TextEditingController();
    TextEditingController remarks = TextEditingController();

    String? departureError;
    String? arrivalError;
    String? destinationError;
    String? remarksError;

    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              void validateFields() {
                setDialogState(() {
                  departureError =
                  departure.text.isEmpty ? 'This field is required' : null;
                  arrivalError =
                  arrival.text.isEmpty ? 'This field is required' : null;
                  destinationError = destination.text.isEmpty
                      ? 'This field is required'
                      : null;
                  remarksError =
                  remarks.text.isEmpty ? 'This field is required' : null;
                });
              }

              // Function to clear error when user starts typing
              void clearErrorOnChange(TextEditingController controller,
                  String? errorField, String fieldName) {
                controller.addListener(() {
                  setDialogState(() {
                    if (controller.text.isNotEmpty) {
                      switch (fieldName) {
                        case 'departure':
                          departureError = null;
                          break;
                        case 'arrival':
                          arrivalError = null;
                          break;
                        case 'destination':
                          destinationError = null;
                          break;
                        case 'remarks':
                          remarksError = null;
                          break;
                      }
                    }
                  });
                });
              }

              // Attach listeners to each field to dynamically clear the error
              clearErrorOnChange(departure, departureError, 'departure');
              clearErrorOnChange(arrival, arrivalError, 'arrival');
              clearErrorOnChange(destination, destinationError, 'destination');
              clearErrorOnChange(remarks, remarksError, 'remarks');
              return Container(
                padding: EdgeInsets.all(28),
                width: size.width * 0.899,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Spacer(), // Automatically takes up space
                          Text(
                            "Request Ticket",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                          height:
                          size.height * 0.01), // Slightly increased spacing
                      Container(
                        width: size.width * 0.74,
                        decoration: BoxDecoration(color: ticket),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.019),
                            // Departure Row
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.015),
                                Text(
                                  ' Departure Date ',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 12,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width: size.width * 0.035),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      if (departureError != null)
                                        Padding(
                                          padding: EdgeInsets.only(left: 1),
                                          child: Text(
                                            departureError!,
                                            style: TextStyle(
                                                color: Colors.red, fontSize: 9),
                                          ),
                                        ),
                                      Container(
                                        width: size.width * 0.42,
                                        height: size.height * 0.032,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 1),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: departure,
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.black),
                                            textAlignVertical:
                                            TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                bottom: size.height * 0.016,
                                                left: size.width *
                                                    0.010, // Padding inside the TextField
                                              ),
                                              hintText: 'dd/mm/yy',
                                              hintStyle:
                                              TextStyle(fontSize: 10),
                                              suffixIcon: IconButton(
                                                padding: EdgeInsets.only(
                                                    bottom: 0.5, left: 20),
                                                onPressed: () => _selectDate(
                                                    context, departure),
                                                icon: Icon(Icons.calendar_month,
                                                    size: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.011),
                            // Arrival Row
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.024),
                                // SizedBox(width: size.width * 0.025),
                                Text(
                                  'Arrival Date',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 12,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width: size.width * 0.089),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      if (arrivalError != null)
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 2),
                                          child: Text(
                                            arrivalError!,
                                            style: TextStyle(
                                                color: Colors.red, fontSize: 9),
                                          ),
                                        ),
                                      Container(
                                        width: size.width * 0.421,
                                        height: size.height * 0.032,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 1),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: TextField(
                                            controller: arrival,
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.black),
                                            textAlignVertical:
                                            TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                bottom: size.height * 0.016,
                                                left: size.width *
                                                    0.010, // Padding inside the TextField
                                              ),
                                              border: InputBorder.none,
                                              hintText: 'dd/mm/yy',
                                              hintStyle:
                                              TextStyle(fontSize: 10),
                                              suffixIcon: IconButton(
                                                padding: EdgeInsets.only(
                                                    bottom: 0.5, left: 20),
                                                onPressed: () => _selectDate(
                                                    context, arrival),
                                                icon: Icon(Icons.calendar_month,
                                                    size: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.012),
                            // Destination Row
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.026),
                                Text(
                                  'Destination',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 12,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width: size.width * 0.089),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      if (destinationError != null)
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 2),
                                          child: Text(
                                            destinationError!,
                                            style: TextStyle(
                                                color: Colors.red, fontSize: 9),
                                          ),
                                        ),
                                      requestContainer(
                                        context,
                                        destination,
                                        size.width * 0.421,
                                        size.height * 0.032,
                                        setDialogState,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.01),
                            // Remarks Row
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.029),
                                Text(
                                  'Remarks',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 12,
                                      fontFamily: 'Inter'),
                                ),
                                SizedBox(width: size.width * 0.12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      if (remarksError != null)
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 2),
                                          child: Text(
                                            remarksError!,
                                            style: TextStyle(
                                                color: Colors.red, fontSize: 9),
                                          ),
                                        ),
                                      Container(
                                        width: size.width * 0.425,
                                        height: size.height * 0.049,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 1),
                                        ),
                                        child: TextField(
                                          controller: remarks,
                                          decoration: InputDecoration(
                                            hintText: 'Text Here',
                                            hintStyle: TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey.shade500),
                                            contentPadding: EdgeInsets.all(6),
                                            isDense: true,
                                            border: InputBorder.none,
                                          ),
                                          textAlignVertical:
                                          TextAlignVertical.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: size.height * 0.010),
                            // Button Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.17,
                                  height: size.height * 0.036,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: black,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: size.width * 0.03),
                                MaterialButton(
                                  minWidth: size.width * 0.125,
                                  height: size.height * 0.035,
                                  onPressed: () async {
                                    validateFields();
                                    if (departureError == null &&
                                        arrivalError == null &&
                                        destinationError == null &&
                                        remarksError == null) {
                                      // Call applyTicketRequest function directly
                                      await applyTicketRequest(departure.text, arrival.text, destination.text, remarks.text);
                                    }
                                  },
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  color: Colors.yellow,
                                ),
                                SizedBox(height: size.height * 0.1,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
      barrierDismissible:
      false, // Prevents dismissing the dialog by tapping outside
    );
  }

  //Request ticket date picker
  DateTime? _fromDate;
  DateTime? _toDate;
  Future<void> _selectedDate(BuildContext context, TextEditingController controller, bool isFromDate) async {
    // Set the initial date based on whether it's the "From Date" or "To Date"
    DateTime initialDate = DateTime.now(); // Default to current date for initial selection

    if (!isFromDate && _fromDate == null) {
      // If trying to select "To Date" without having set "From Date" first
      _showErrorDialog(context, "Please select the From Date first.");
      return; // Exit early as "To Date" should not be selected before "From Date"
    }

    if (!isFromDate) {
      // If selecting "To Date", ensure it starts from "From Date"
      initialDate = _fromDate!; // Default initial date is the selected "From Date"
    }

    // Set the first date for the date picker based on whether it's "From Date" or "To Date"
    DateTime firstDate = isFromDate ? DateTime.now() : _fromDate!; // Allow "To Date" from the selected "From Date" onwards

    // Show the date picker
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate, // Disable all dates before the selected "From Date"
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
        controller.text = formattedDate;

        if (isFromDate) {
          _fromDate = pickedDate; // Update the "From Date"
        } else {
          // Validate if "To Date" is selected before "From Date"
          if (pickedDate.isBefore(_fromDate!)) {
            _showErrorDialog(context, "To Date must be on or after From Date.");
            return; // Exit early if the date is invalid
          }
          _toDate = pickedDate; // Update the "To Date"
        }

        // Optionally calculate days between dates if both are selected

      });
    }
  }

  //filter leave date picker
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  DateTime? selectedFromDate; // Variable to hold the selected date from the "From" field

  void _selectDate(BuildContext context, TextEditingController controller, {bool isFromField = false}) {
    DateTime initialDate = DateTime.now(); // Default initial date

    if (isFromField) {
      // Selecting date for "From" field
      showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2000), // Set a reasonable start date for selection
        lastDate: DateTime(2100),
      ).then((selectedDate) {
        if (selectedDate != null) {
          controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
          selectedFromDate = selectedDate; // Store the selected "From" date
        }
      });
    } else {
      // Ensure the "From" date is selected before opening the picker for the "To" date
      if (selectedFromDate == null) {
        // Show an error dialog if the "From" date hasn't been selected yet
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a "From" date first.')),
        );
        return;
      }

      // Selecting date for "To" field
      showDatePicker(
        context: context,
        initialDate: selectedFromDate!.add(Duration(days: 1)), // Start initial date the day after "From" date
        firstDate: selectedFromDate!, // Use the selected "From" date as the earliest "To" date
        lastDate: DateTime(2100),
      ).then((selectedDate) {
        if (selectedDate != null) {
          controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
          filterLeaveData();
        }
      });
    }
  }



  //apply and fetch ticket request data's
  List<TicketRequest> ticketRequests = [];
  List<TicketRequest?> filteredTicketRequests = [];
  bool isLoading = true;
  bool showReviewTicketTable = false;
  TextEditingController departure=TextEditingController();
  TextEditingController arrival=TextEditingController();
  TextEditingController destination=TextEditingController();
  TextEditingController remarks=TextEditingController();

  Future<void> applyTicketRequest(String departureText, String arrivalText, String destinationText, String remarksText) async {
    final box = GetStorage();
    String empId = box.read('userId') ?? '';
    String hr = box.read('hr') ?? 'N/A';
    String hrEmail = box.read('hrEmail') ?? 'N/A';
    print(empId);

    if (departureText.isEmpty || arrivalText.isEmpty || destinationText.isEmpty || remarksText.isEmpty) {
      Get.back(); // Close loading dialog if open
      Get.defaultDialog(
        title: 'Error',
        content: Text('Please fill all required fields.'),
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
      return;
    }

    DateTime? fromDate;
    DateTime? toDate;
    try {
      fromDate = DateFormat('dd/MM/yyyy').parse(departureText);
      toDate = DateFormat('dd/MM/yyyy').parse(arrivalText);
    } catch (e) {
      Get.back(); // Close loading dialog if open
      Get.defaultDialog(
        title: 'Error',
        content: Text('Invalid date format. Please use dd/MM/yyyy.'),
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
      return;
    }

    if (fromDate == null || toDate == null || fromDate.isAfter(toDate)) {
      Get.back(); // Close loading dialog if open
      Get.defaultDialog(
        title: 'Error',
        content: Text('Invalid date selection. Please check the from and to dates.'),
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
      return;
    }

    final ticketRequest = TicketRequest(
      empID: empId,
      departureDate: TemporalDateTime(fromDate),
      arrivalDate: TemporalDateTime(toDate),
      destination: destinationText,
      remarks: remarksText,
      hrStatus: 'Pending',
      empStatus: 'Pending',
      hrName: hr,
    );

    Get.defaultDialog(
      title: 'Confirm',
      content: Text('Are you sure you want to aply ticket request?'),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('No', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () async {
            Get.back(); // Close the confirmation dialog

            final request = ModelMutations.create(ticketRequest);
            final response = await Amplify.API.mutate(request: request).response;
            Get.back(); // Close loading dialog

            if (response.errors.isEmpty && response.data != null) {
              Get.defaultDialog(
                title: 'Success',
                content: Text('Ticket request submitted successfully.'),
                confirmTextColor: Colors.white,
                onConfirm: () async {
                  Get.back();
                  fetchTicketRequests();

                  if (hr != 'N/A') {
                    print('Notifying HR: $hr');
                    await _notifyUser(hr, 'Ticket request pending');
                  }

                  if (hrEmail != 'N/A') {
                    bool emailSent = await sendTicketEmail(hrEmail, 'Ticket request submitted');
                    if (emailSent) {
                      await storeTicketEmailNotification(empId,  'leave_no-reply@adininworks.com', hrEmail);
                    }
                  }
                },
              );
            } else {
              Get.defaultDialog(
                title: 'Error',
                content: Text('Failed to submit the ticket request. Please try again.'),
                confirmTextColor: Colors.white,
                onConfirm: () => Get.back(),
              );
            }
          },
          child: Text('Yes', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }

  Future<bool> sendTicketEmail(String hrEmail, String employeeName) async {
    // Create an instance of the AWS SES client
    final awsCredentials = AwsClientCredentials(
      accessKey: 'AKIAQXPZCWE7ZED5EI2A', // Replace with your AWS access key
      secretKey: 'LJwP2fd40b8OZoY28/0iLWr5op3eDTUZK7ugNcD3', // Replace with your AWS secret key
    );

    final ses = SES(
      region: 'ap-southeast-1', // e.g., 'us-east-1'
      credentials: awsCredentials,
    );


    final messageBody = 'Employee $employeeName applied ticket request.\n'
        'You can view the details here: https://dev.dxtlxvdrz6jj5.amplifyapp.com';
    final subject = 'Ticket request Notification';

    try {
      // Send an email to the manager's email
      await ses.sendEmail(
        destination: Destination(toAddresses: [hrEmail]),
        message: Message(
          subject: Content(data: subject),
          body: Body(text: Content(data: messageBody)),
        ),
        source: 'leave_no-reply@adininworks.com', // Replace with a verified email address in SES
      );

      print('Email sent to $hrEmail');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  Future<void> storeTicketEmailNotification(String empID, String senderEmail, String recipientEmail) async {
    final emailNotification = EmailNotifi(
      empID: empID,
      senderEmail: senderEmail,
      receipentEmail: [recipientEmail],
      status: 'Pending',
      message: 'Ticket request notification sent by $employeeName',

    );

    try {
      final request = ModelMutations.create(emailNotification);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.errors.isEmpty && response.data != null) {
        print('Ticket notification stored successfully');
      } else {
        print('Error storing ticket notification: ${response.errors}');
      }
    } catch (e) {
      print('Exception while storing ticket notification: $e');
    }
  }

  Future<void> _notifyUser(String recipient, String leaveStatus) async {
    print('Notifying $recipient about the ticket request status: $leaveStatus');
    // Example: API call or notification logic
  }

  Future<void> fetchTicketRequests() async {
    try {
      // Get the current user's ticket requests
      final box = GetStorage();
      String empId = box.read('userId') ?? '';
      print(empId);

      final request = ModelQueries.list(
        TicketRequest.classType,
        where: TicketRequest.EMPID.eq(empId), // Fetch tickets for the current user
      );

      final response = await Amplify.API.query(request: request).response;
      // print('response : ${response}');

      // Check for errors in the response
      if (response.errors.isNotEmpty || response.data == null) {

        return;
      }

      // If successful, process the data
      setState(() {
        // Filter out null items and cast to TicketRequest
        ticketRequests = response.data!.items.where((ticket) => ticket != null).cast<TicketRequest>().toList();

        // Sort the ticket requests based on the createdAt field in descending order
        ticketRequests.sort((a, b) {
          DateTime dateA = DateTime.parse(a.createdAt.toString());
          DateTime dateB = DateTime.parse(b.createdAt.toString());
          return dateB.compareTo(dateA); // Descending order
        });

        filteredTicketRequests = List.from(ticketRequests); // Initially show all ticket requests
        isLoading = false;
      });

      if (ticketRequests.isEmpty) {
        print('No ticket request found');
      }
    } catch (e) {
      // Handle general errors
      setState(() {
        isLoading = false;
      });
      print(e);

    }
  }

  // Fetch and filter leave data's
  List<LeaveStatus?> allLeaveData = []; // Your leave data
  List<LeaveStatus?> filteredLeaveData = [];

  Future<void> fetchLeaveData() async {
    try {
      setState(() => isLoading = true);

      final box = GetStorage();
      String empId = box.read('userId') ?? '';

      final request = ModelQueries.list(
        LeaveStatus.classType,
        where: LeaveStatus.EMPID.eq(empId),
      );

      final response = await Amplify.API.query(request: request).response;
      // print(response.data);

      if (response.errors.isNotEmpty || response.data == null) {
        print('Errors: ${response.errors}');
        _showAlertDialog('Error', 'Failed to fetch leave data.');
        setState(() => isLoading = false);
        return;
      }

      setState(() {
        allLeaveData = response.data!.items
            .where((leave) => leave != null)
            .cast<LeaveStatus>()
            .toList();

        // Format the dates to local time
        var leaveDates = allLeaveData.map((leave) {
          // Assuming `fromDate` and `toDate` are TemporalDate
          String formattedFromDate = leave!.fromDate != null
              ? DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())
              : 'No Date';

          String formattedToDate = leave.toDate != null
              ? DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())
              : 'No Date';

          // Print formatted dates for debugging
          // print('From Date: $formattedFromDate, To Date: $formattedToDate');

          return {
            'leave': leave,
            'formattedFromDate': formattedFromDate,
            'formattedToDate': formattedToDate,
          };
        }).toList();

        // Keep the original list structure
        allLeaveData = leaveDates.map((item) => item['leave'] as LeaveStatus).toList();

        // Sort by 'createdAt' in descending order
        allLeaveData.sort((a, b) {
          DateTime dateA = DateTime.parse(a!.createdAt.toString());
          DateTime dateB = DateTime.parse(b!.createdAt.toString());
          return dateB.compareTo(dateA);
        });

        filteredLeaveData = List.from(allLeaveData);
        isLoading = false;
      });

      if (allLeaveData.isEmpty) {
        print('No leave data found for the user.');
      }
    } catch (e) {
      setState(() => isLoading = false);
      print('Failed to fetch leave data: $e');
      _showAlertDialog('Error', 'An unexpected error occurred.');
    }
  }

  void filterLeaveData() {
    // Check if both from and to date fields are empty
    if (from.text.isEmpty && to.text.isEmpty) {
      setState(() {
        // Reset both leave data and ticket requests when no filter is applied
        filteredLeaveData = allLeaveData;
        filteredTicketRequests = ticketRequests;
      });
      return; // Exit the function since no filtering is needed
    }

    // Variables to store parsed dates
    DateTime? fromDate;
    DateTime? toDate;

    try {
      // Parse the 'from' date if it's not empty
      if (from.text.isNotEmpty) {
        fromDate = DateFormat('dd/MM/yyyy').parse(from.text);
      }
      // Parse the 'to' date if it's not empty
      if (to.text.isNotEmpty) {
        toDate = DateFormat('dd/MM/yyyy').parse(to.text);
      }
    } catch (e) {
      // Handle invalid date format errors
      print('Error parsing dates: $e');
      _showAlertDialog('Error', 'Invalid date format.');
      return;
    }

    // Filter LeaveStatus data based on the from and to dates
    List<LeaveStatus?> tempFilteredLeave = allLeaveData.where((leave) {
      if (leave == null || leave.fromDate == null || leave.toDate == null) return false;

      final leaveFromDate = leave.fromDate!.getDateTimeInUtc().toLocal();
      final leaveToDate = leave.toDate!.getDateTimeInUtc().toLocal();

      bool afterFrom = fromDate != null
          ? leaveFromDate.isAfter(fromDate) || leaveFromDate.isAtSameMomentAs(fromDate)
          : true; // Include all data if no 'from' date
      bool beforeTo = toDate != null
          ? leaveToDate.isBefore(toDate.add(Duration(days: 1)))
          : true; // Include all data if no 'to' date

      return afterFrom && beforeTo; // Return true if within the date range
    }).toList();

    // Filter TicketRequest data based on the from and to dates
    List<TicketRequest?> tempFilteredTickets = ticketRequests.where((ticket) {
      if (ticket == null || ticket.departureDate == null || ticket.arrivalDate == null) return false;

      final ticketDepartureDate = ticket.departureDate!.getDateTimeInUtc().toLocal();
      final ticketArrivalDate = ticket.arrivalDate!.getDateTimeInUtc().toLocal();

      bool afterFrom = fromDate != null
          ? ticketDepartureDate.isAfter(fromDate) || ticketDepartureDate.isAtSameMomentAs(fromDate)
          : true; // Include all data if no 'from' date
      bool beforeTo = toDate != null
          ? ticketArrivalDate.isBefore(toDate.add(Duration(days: 1)))
          : true; // Include all data if no 'to' date

      return afterFrom && beforeTo; // Return true if within the date range
    }).toList();

    // Update the filtered data in the state
    setState(() {
      filteredLeaveData = tempFilteredLeave; // Update filtered leave data
      filteredTicketRequests = tempFilteredTickets; // Update filtered ticket request data
    });
  }

  //update leave and ticket Status
  Future<bool> updateLeaveStatus(LeaveStatus leave) async {
    // Create a new copy of the leave with the updated empStatus field
    final updatedLeave = leave.copyWith(empStatus: 'Cancelled');

    // Create the update mutation request
    final request = ModelMutations.update(updatedLeave);

    try {
      // Call the API to execute the mutation
      final response = await Amplify.API.mutate(request: request).response;

      // Check for errors or success
      if (response.data != null) {
        print('Leave status updated successfully: ${response.data}');

        // Update local leave data to reflect the change immediately
        setState(() {
          // Update the `allLeaveData` list
          final index = allLeaveData.indexWhere((l) => l?.id == updatedLeave.id);
          if (index != -1) {
            allLeaveData[index] = updatedLeave; // Update the main list
          }

          // Re-filter `filteredLeaveData` based on your existing filter criteria
          filteredLeaveData = allLeaveData.whereType<LeaveStatus>().where((leave) {
            // Apply your filter criteria here (modify as needed)
            return true;  // Update with the actual criteria used for filtering
          }).toList();
          CalculateLeaveData();
        });

        return true; // Indicate success
      } else {
        print('Failed to update leave status: ${response.errors}');
        return false; // Indicate failure
      }
    } catch (e) {
      print('Error updating leave status: $e');
      return false; // Indicate failure
    }
  }


  Future<bool> updateTicketStatus(TicketRequest ticketRequest) async {
    // Create a copy of the ticket request with the updated status
    final updatedTicketRequest = ticketRequest.copyWith(empStatus: 'Cancelled');

    // Create the update mutation request
    final request = ModelMutations.update(updatedTicketRequest);

    try {
      // Execute the mutation request
      final response = await Amplify.API.mutate(request: request).response;

      // Check if the update was successful
      if (response.data != null) {
        print('Ticket request status updated successfully: ${response.data}');

        // Update the local ticket data immediately to reflect the change
        setState(() {
          final index = ticketRequests.indexWhere((ticket) => ticket?.id == updatedTicketRequest.id);
          if (index != -1) {
            // Update the local list with the modified ticket request
            ticketRequests[index] = updatedTicketRequest;
          }

          // Re-filter `filteredTicketData` if applicable, based on any existing criteria
          filteredTicketRequests = ticketRequests.whereType<TicketRequest>().where((ticket) {
            // Apply any filtering criteria here, if necessary
            return true; // Modify this condition based on your filtering logic
          }).toList();
        });

        return true;  // Indicate success
      } else {
        print('Failed to update ticket request status: ${response.errors}');
        return false;  // Indicate failure
      }
    } catch (e) {
      print('Error updating ticket request status: $e');
      return false;  // Indicate failure
    }
  }


  //delete leave and ticket status
  Future<void> deleteLeave(LeaveStatus leave) async {
    try {
      // Deleting the leave record by its ID
      print('Attempting to delete leave with ID: ${leave.id}');

      final deleteRequest = ModelMutations.delete(leave);
      final deleteResponse = await Amplify.API.mutate(request: deleteRequest).response;

      // Check for errors during deletion
      if (deleteResponse.errors.isNotEmpty) {
        print('Errors deleting leave ID ${leave.id}: ${deleteResponse.errors}');
        _showAlertDialog('Error', 'Failed to delete the leave record.');
        return;
      }

      // Successfully deleted
      print('Leave deleted successfully: ${leave.toString()}');

      // Remove from the local state
      setState(() {
        allLeaveData.removeWhere((l) => l?.id == leave.id);
        filteredLeaveData.removeWhere((l) => l?.id == leave.id);
      });

      // Show success message
      _showAlertDialog('Success', 'Leave request deleted successfully.');
    } catch (e) {
      print('Failed to delete leave: $e');
      _showAlertDialog('Error', 'An unexpected error occurred.');
    }
  }

  Future<void> deleteTicketRequest(TicketRequest request) async {
    try {
      print('Attempting to delete ticket request with ID: ${request.id}');

      final deleteRequest = ModelMutations.delete(request);
      final deleteResponse = await Amplify.API.mutate(request: deleteRequest).response;

      // Check for errors during deletion
      if (deleteResponse.errors.isNotEmpty) {
        print('Errors deleting request ID ${request.id}: ${deleteResponse.errors}');
        _showAlertDialog('Error', 'Failed to delete the ticket request.');
        return;
      }

      // Successfully deleted
      print('Ticket request deleted successfully: ${request.toString()}');

      // Remove from the local state
      setState(() {
        ticketRequests.removeWhere((t) => t?.id == request.id);
        filteredTicketRequests.removeWhere((t) => t?.id == request.id);
      });

      // Show success message
      _showAlertDialog('Success', 'Ticket request deleted successfully.');
    } catch (e) {
      print('Failed to delete request: $e');
      _showAlertDialog('Error', 'An unexpected error occurred.');
    }
  }

  // leave pending dialog
  void _pendingDialog(BuildContext context, int rowIndex, LeaveStatus leave, ) {
    final Size size = MediaQuery.of(context).size;
    String status = 'Pending'; // Initialize the status locally
    final box = GetStorage();
    String empId = box.read('userId') ?? '';

    Get.dialog(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: size.width * 0.305,
              decoration: BoxDecoration(
                color: dialog,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height:  size.height * 0.057,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.128),
                        Text(
                          'Pending',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 22,fontWeight: FontWeight.bold ,color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.075),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined, size: 26, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.061,),
                      Text(employeeName.isNotEmpty ? employeeName : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Job Title',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.048,),
                      Text(Positions.isNotEmpty ? Positions : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.059,),
                      Text(badgeno.isNotEmpty ? badgeno: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.047,),
                      Text(department.isNotEmpty ? department : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Leave Type',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.035,),
                      Text(leave.leaveType ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Selected Dates',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.016,),
                      Text('${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Apply to',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.048,),
                      Text(
                        leave.applyTo != null && leave.applyTo is List
                            ? (leave.applyTo as List).join(', ')
                            : leave.applyTo?.toString() ?? '',
                        style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),)
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.035,),
                      Text('${leave.days ?? 0} days',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: size.width * 0.050),
                      Text('Reason', style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: black)),
                      SizedBox(width: size.width * 0.050),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            leave.reason ?? 'N/A',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: black),
                            overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.024),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.121),
                      MaterialButton(
                        minWidth: size.width * 0.062,
                        height: size.height * 0.052,
                        onPressed: ()  {
                          Navigator.pop(context);
                          deleteLeave(leave);
                          // _showPendingCancelDialog(context, leave,);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.030),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  void _tabpendingDialog(BuildContext context, int rowIndex, LeaveStatus leave,) {
    final Size size = MediaQuery.of(context).size;
    String status = 'Pending'; // Initialize the status locally

    Get.dialog(
      StatefulBuilder( // Use StatefulBuilder to manage state within the dialog
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: size.width * 0.4,
              decoration: BoxDecoration(
                color: dialog,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height:  size.height * 0.057,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.160),
                        Text(
                          'Pending',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.110),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined, size: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.074,),
                      Text(employeeName.isNotEmpty? employeeName : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Job Title',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.058,),
                      Text(Positions.isNotEmpty ? Positions :'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.074,),
                      Text(badgeno.isNotEmpty ? badgeno : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.060,),
                      Text(department.isNotEmpty? department : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Leave Type',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.046,),
                      Text(leave.leaveType ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Selected Dates',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.020,),
                      Text('${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Apply to',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.062,),
                      Text(
                        leave.applyTo != null && leave.applyTo is List
                            ? (leave.applyTo as List).join(', ')
                            : leave.applyTo?.toString() ?? '',
                        style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),)
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.047,),
                      Text('${leave.days ?? 0} days',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.057,),
                      Text('Reason',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.066,),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            leave.reason ?? 'N/A',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: black),
                            overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  Row(
                    children: [
                      SizedBox(width:size.width *  0.152,),
                      MaterialButton(
                        minWidth: size.width * .085,
                        height: size.height * 0.050,
                        onPressed: () {
                          _showPendingCancelDialog(context, leave);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.028),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );

    // Refresh the DataTable to reflect the updated status in UI (if necessary)
  }

  void _phonependingDialog(
      BuildContext context,
      int rowIndex,
      LeaveStatus leave,
      ) {
    final Size size = MediaQuery.of(context).size;
    String status = 'Pending'; // Initialize the status locally

    Get.dialog(
      StatefulBuilder(
        // Use StatefulBuilder to manage state within the dialog
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: size.width * 0.77,
              decoration: BoxDecoration(
                color: dialog,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: size.height * 0.052,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.245),
                        Text(
                          'Pending',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.135),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined,
                              size: 22, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(width: size.width * 0.16),
                      Text(
                        employeeName,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Job Title',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.12,
                      ),
                      Text(
                        Positions,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Badge',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 12, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.16,
                      ),
                      Text(
                        badgeno,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Dept/Div',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.12,
                      ),
                      Text(
                        department,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Leave Type',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.08,
                      ),
                      Text(
                        leave.leaveType ?? 'N/A',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Selected Dates',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.021,
                      ),
                      Text(
                        '${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Apply to',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.12,
                      ),
                      Text(
                        leave.applyTo != null && leave.applyTo is List
                            ? (leave.applyTo as List).join(', ')
                            : leave.applyTo?.toString() ?? '',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'No of days',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.084,
                      ),
                      Text(
                        '${leave.days ?? 0} days',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Reason',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.13,
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            leave.reason ?? 'N/A',
                            style: TextStyle(fontFamily: 'Inter', fontSize: 13, color: black),
                            overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.299,
                      ),
                      MaterialButton(
                        minWidth: size.width * .150,
                        height: size.height * 0.047,
                        onPressed: () async {
                          _showPendingCancelDialog(context, leave);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.028),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  //leave approved dialog
  void _approvedDialog(BuildContext context, int rowIndex, LeaveStatus leave,) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.305,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height:  size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.123),
                    Text(
                      'Approved',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.080),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined, size: 26, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.016),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.052,),
                  Text(employeeName.isNotEmpty ? employeeName:'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Job Title',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.039,),
                  Text(Positions.isNotEmpty? Positions:'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.050,),
                  Text(badgeno.isNotEmpty ? badgeno:'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.041,),
                  Text(department.isNotEmpty ? department : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Leave Type',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.027,),
                  Text(leave.leaveType ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.047,),
                  Text('Selected Dates',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.013,),
                  Text('${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Apply to',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.044,),
                  Text(
                    leave.applyTo != null && leave.applyTo is List
                        ? (leave.applyTo as List).join(', ')
                        : leave.applyTo?.toString() ?? '',
                    style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),)
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.031,),
                  Text('${leave.days ?? 0} days',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Reason',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.047,),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        leave.reason ?? 'N/A',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: black),
                        overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.020),
              Row(
                children: [
                  SizedBox(width: size.width * 0.121),
                  MaterialButton(
                    minWidth: size.width * 0.062,
                    height: size.height * 0.050,
                    onPressed: () {
                      _showApprovedCancelDialog(context,leave,);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                    ),
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.020),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _tabapprovedDialog(BuildContext context, int rowIndex, LeaveStatus leave,) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.4,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height:  size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.165),
                    Text(
                      'Approved',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.090),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined, size: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.014),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.075,),
                  Text(employeeName.isNotEmpty ? employeeName:'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Job Title',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.058,),
                  Text(Positions.isNotEmpty ? Positions: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.073,),
                  Text(badgeno.isNotEmpty ? badgeno: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.057,),
                  Text(department.isNotEmpty ? department: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Leave Type',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.042,),
                  Text(leave.leaveType ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Selected Dates',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.016,),
                  Text('${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Apply to',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.059,),
                  Text(
                    leave.applyTo != null && leave.applyTo is List
                        ? (leave.applyTo as List).join(', ')
                        : leave.applyTo?.toString() ?? '',
                    style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),)
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.043,),
                  Text('${leave.days ?? 0} days',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.061,),
                  Text('Reason',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.062,),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        leave.reason ?? 'N/A',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: black),
                        overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.015),
              Row(
                children: [
                  SizedBox(width:size.width *  0.152,),
                  MaterialButton(
                    minWidth: size.width * .085,
                    height: size.height * 0.050,
                    onPressed: () {
                      _showApprovedCancelDialog(context, leave);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                    ),
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.028),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _phoneapprovedDialog(
      BuildContext context,
      int rowIndex,
      LeaveStatus leave,
      ) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.78,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.235),
                    Text(
                      'Approved',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.170),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined,
                          size: 23, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.016),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.160,
                  ),
                  Text(
                    employeeName,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Job Title',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    Positions,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Badge',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.152,
                  ),
                  Text(
                    badgeno,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Dept/Div',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    department,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Leave Type',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.085,
                  ),
                  Text(
                    leave.leaveType ?? 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Selected Dates',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.020,
                  ),
                  Text(
                    '${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Apply to',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    leave.applyTo != null && leave.applyTo is List
                        ? (leave.applyTo as List).join(', ')
                        : leave.applyTo?.toString() ?? '',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'No of days',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.089,
                  ),
                  Text(
                    '${leave.days ?? 0} days',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Reason',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.13,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        leave.reason ?? 'N/A',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 13, color: black),
                        overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.015),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.299,
                  ),
                  MaterialButton(
                    minWidth: size.width * .080,
                    height: size.height * 0.040,
                    onPressed: () {
                      _showApprovedCancelDialog(context, leave,);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                    ),
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.015),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  //leave rejected dialog
  void _rejectedDialog(BuildContext context, int rowIndex, LeaveStatus leave) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.305,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height:  size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.120),
                    Text(
                      'Rejected',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.085),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined, size: 26, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.014),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.052,),
                  Text(employeeName.isNotEmpty ? employeeName : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Job Title',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.038,),
                  Text(Positions.isNotEmpty ? Positions :'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.050,),
                  Text(badgeno.isNotEmpty ? badgeno: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.039,),
                  Text(department.isNotEmpty ? department : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Leave Type',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.028,),
                  Text(leave.leaveType ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.047,),
                  Text('Selected Dates',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.013,),
                  Text('${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Apply to',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.044,),
                  Text(
                    leave.applyTo != null && leave.applyTo is List
                        ? (leave.applyTo as List).join(', ')
                        : leave.applyTo?.toString() ?? '',
                    style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),)
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.029,),
                  Text('${leave.days ?? 0} days',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Reason',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.045,),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        leave.reason ?? 'N/A',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: black),
                        overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.022),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Comments',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.028,),
                  Container(
                    width: size.width * 0.15,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: grey,width: 1)
                    ),
                    child: Text( ' ${leave.managerRemarks}' ?? "",style: TextStyle(color: black,fontSize: 14,fontFamily: 'Inter'),),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.030),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _tabrejectedDialog(BuildContext context, int rowIndex, LeaveStatus leave) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.4,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height:  size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.165),
                    Text(
                      'Rejected',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.090),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined, size: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.014),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.074,),
                  Text(employeeName.isNotEmpty ? employeeName: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Job Title',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.056,),
                  Text(Positions.isNotEmpty ? Positions: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.070,),
                  Text(badgeno.isNotEmpty ? badgeno: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.055,),
                  Text(department.isNotEmpty ? department: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Leave Type',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.040,),
                  Text(leave.leaveType ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Selected Dates',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.016,),
                  Text('${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Apply to',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.058,),
                  Text(
                    leave.applyTo != null && leave.applyTo is List
                        ? (leave.applyTo as List).join(', ')
                        : leave.applyTo?.toString() ?? '',
                    style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),)
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.041,),
                  Text('${leave.days ?? 0} days',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Reason',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.062,),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        leave.reason ?? 'N/A',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: black),
                        overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.022),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.060,),
                  Text('Comments',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.039,),
                  Container(
                    width: size.width * 0.175,
                    height: size.height * 0.057,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: grey,width: 1)
                    ),
                    child: Text( ' ${leave.managerRemarks}' ?? "" ,style: TextStyle(color: black,fontSize: 12,fontFamily: 'Inter'),),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.028),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _phonerejectedDialog(
      BuildContext context, int rowIndex, LeaveStatus leave) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.77,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.240),
                    Text(
                      'Rejected',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.150),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined,
                          size: 22, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.014),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.16,
                  ),
                  Text(
                    employeeName,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.017,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Job Title',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    Positions,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Badge',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  Text(
                    badgeno,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Dept/Div',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    department,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Leave Type',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.079,
                  ),
                  Text(
                    leave.leaveType ?? 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Selected Dates',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.017,
                  ),
                  Text(
                    '${DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())} to ${DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())}',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Apply to',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    leave.applyTo != null && leave.applyTo is List
                        ? (leave.applyTo as List).join(', ')
                        : leave.applyTo?.toString() ?? '',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'No of days',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.08,
                  ),
                  Text(
                    '${leave.days ?? 0} days',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Reason',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.13,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        leave.reason ?? 'N/A',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 13, color: black),
                        overflow: TextOverflow.ellipsis, // Optional, to truncate the text with an ellipsis if it's too long
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.022),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Comments',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(width: size.width * 0.08),
                  Container(
                    width: size.width * 0.395,
                    height: size.height * 0.050,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: grey, width: 1)),
                    child: Text(
                      ' ${leave.managerRemarks}' ?? "",
                      style: TextStyle(
                          color: black, fontSize: 11, fontFamily: 'Inter'),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.028),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  //ticket pending dialog
  void _ticketpendingDialog(BuildContext context, int rowIndex,TicketRequest request ) {
    final Size size = MediaQuery.of(context).size;
    String status = 'Pending'; // Initialize the status locally

    Get.dialog(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: size.width * 0.260,
              decoration: BoxDecoration(
                color: dialog,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height:  size.height * 0.057,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.104),
                        Text(
                          'Pending',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 22,fontWeight: FontWeight.bold ,color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.065),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined, size: 26, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.020),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.057,),
                      Text(employeeName.isNotEmpty ? employeeName : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.055,),
                      Text(badgeno.isNotEmpty ? badgeno : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.044,),
                      Text(department.isNotEmpty ? department: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Position',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.047,),
                      Text(Positions.isNotEmpty ? Positions : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Destination',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.031,),
                      Text( request?.destination ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Departure Date',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.0125,),
                      Text(request?.departureDate != null
                          ? DateFormat('dd/MM/yyyy').format(request!.departureDate!.getDateTimeInUtc().toLocal())
                          : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.050,),
                      Text('Arrival Date',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                      SizedBox(width:size.width *  0.0295,),
                      Text(request!.arrivalDate != null
                          ? DateFormat('dd/MM/yyyy').format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                          : 'N/A' ,style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.028),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.098),
                      MaterialButton(
                        minWidth: size.width * 0.062,
                        height: size.height * 0.052,
                        onPressed: () {
                          _showTicketPendingCancelDialog(context, request);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.030),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  void _tabticketpendingDialog(BuildContext context, int rowIndex, TicketRequest request) {
    final Size size = MediaQuery.of(context).size;
    String status = 'Pending'; // Initialize the status locally

    Get.dialog(
      StatefulBuilder( // Use StatefulBuilder to manage state within the dialog
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: size.width * 0.4,
              decoration: BoxDecoration(
                color: dialog,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height:  size.height * 0.057,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.160),
                        Text(
                          'Pending',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.110),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined, size: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.020),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.082,),
                      Text(employeeName.isNotEmpty ? employeeName: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.079,),
                      Text(badgeno.isNotEmpty ? badgeno: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.066,),
                      Text(department.isNotEmpty ? department: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Position',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.068,),
                      Text(Positions.isNotEmpty ? Positions: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 13,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Destination',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.050,),
                      Text(request?.destination ?? 'Unknown',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Departure Date',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.026,),
                      Text(request?.departureDate != null
                          ? DateFormat('dd/MM/yyyy').format(request!.departureDate!.getDateTimeInUtc().toLocal())
                          : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Arrival Date',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.045,),
                      Text(request!.arrivalDate != null
                          ? DateFormat('dd/MM/yyyy').format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                          : 'N/A' ,style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  Row(
                    children: [
                      SizedBox(width:size.width *  0.152,),
                      MaterialButton(
                        minWidth: size.width * .085,
                        height: size.height * 0.050,
                        onPressed: () {
                          _showTicketPendingCancelDialog(context, request);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.028),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );

    // Refresh the DataTable to reflect the updated status in UI (if necessary)
  }

  void _phoneticketpendingDialog(
      BuildContext context, int rowIndex, TicketRequest request) {
    final Size size = MediaQuery.of(context).size;
    String status = 'Pending'; // Initialize the status locally

    Get.dialog(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: size.width * 0.74,
              decoration: BoxDecoration(
                color: dialog,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: size.height * 0.057,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.27),
                        Text(
                          'Pending',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.099),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined,
                              size: 26, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.014),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.158,
                      ),
                      Text(
                        employeeName,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Badge',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.149,
                      ),
                      Text(
                        badgeno,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Dept/Div',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.116,
                      ),
                      Text(
                        department,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Position',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.126,
                      ),
                      Text(
                        Positions,
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 12, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Destination',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.078,
                      ),
                      Text(
                        request?.destination ?? 'Unknown',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Departure Date',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.016,
                      ),
                      Text(
                        request?.departureDate != null
                            ? DateFormat('dd/MM/yyyy')
                            .format(request!.departureDate!.getDateTimeInUtc().toLocal())
                            : 'N/A',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.014,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * 0.10,
                      ),
                      Text(
                        'Arrival Date',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                      SizedBox(
                        width: size.width * 0.07,
                      ),
                      Text(
                        request!.arrivalDate != null
                            ? DateFormat('dd/MM/yyyy')
                            .format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                            : 'N/A',
                        style: TextStyle(
                            fontFamily: 'Inter', fontSize: 13, color: black),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.024),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.3),
                      MaterialButton(
                        minWidth: size.width * 0.062,
                        height: size.height * 0.046,
                        onPressed: () {
                          _showTicketPendingCancelDialog(context, request);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.030),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );
  }

  //ticket approved dialog
  void _ticketapprovedDialog(BuildContext context,int rowIndex,TicketRequest request ) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.260,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height:  size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.105),
                    Text(
                      'Approved',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.050),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined, size: 26, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.020),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.057,),
                  Text(employeeName.isNotEmpty ? employeeName : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.055,),
                  Text(badgeno.isNotEmpty ? badgeno : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.044,),
                  Text(department.isNotEmpty ? department :'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Position',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.047,),
                  Text(Positions.isNotEmpty ? Positions : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Destination',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.032,),
                  Text( request?.destination ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Departure Date',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.0145,),
                  Text(request?.departureDate != null
                      ? DateFormat('dd/MM/yyyy').format(request!.departureDate!.getDateTimeInUtc().toLocal())
                      : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Arrival Date',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.0315,),
                  Text(request!.arrivalDate != null
                      ? DateFormat('dd/MM/yyyy').format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                      : 'N/A' ,style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.024),
              Row(
                children: [
                  SizedBox(width: size.width * 0.105),
                  MaterialButton(
                    minWidth: size.width * 0.062,
                    height: size.height * 0.052,
                    onPressed: () {
                      _showTicketApprovedCancelDialog(context, request);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                    ),
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.030),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _tabticketapprovedDialog(BuildContext context, int rowIndex, TicketRequest request) {
    final Size size = MediaQuery.of(context).size;
    String status = 'Pending'; // Initialize the status locally

    Get.dialog(
      StatefulBuilder( // Use StatefulBuilder to manage state within the dialog
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              width: size.width * 0.4,
              decoration: BoxDecoration(
                color: dialog,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height:  size.height * 0.057,
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.160),
                        Text(
                          'Approved',
                          style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                        ),
                        SizedBox(width: size.width * 0.110),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel_outlined, size: 24, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.020),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.082,),
                      Text(employeeName.isNotEmpty ? employeeName: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.079,),
                      Text(badgeno.isNotEmpty ? badgeno: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.066,),
                      Text(department.isNotEmpty ? department: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Position',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.068,),
                      Text(Positions.isNotEmpty ? Positions: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 13,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Destination',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.050,),
                      Text(request?.destination ?? 'Unknown',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Departure Date',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.026,),
                      Text(request?.departureDate != null
                          ? DateFormat('dd/MM/yyyy').format(request!.departureDate!.getDateTimeInUtc().toLocal())
                          : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.014,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:size.width *  0.065,),
                      Text('Arrival Date',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                      SizedBox(width:size.width *  0.045,),
                      Text(request!.arrivalDate != null
                          ? DateFormat('dd/MM/yyyy').format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                          : 'N/A' ,style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  Row(
                    children: [
                      SizedBox(width:size.width *  0.152,),
                      MaterialButton(
                        minWidth: size.width * .085,
                        height: size.height * 0.050,
                        onPressed: () {
                          _showTicketApprovedCancelDialog(context, request);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15, fontFamily: 'Inter'),
                        ),
                        color: Colors.yellow,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.028),
                ],
              ),
            ),
          );
        },
      ),
      barrierDismissible: false,
    );

    // Refresh the DataTable to reflect the updated status in UI (if necessary)
  }

  void _phoneticketapprovedDialog(
      BuildContext context, int rowIndex, TicketRequest request) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.75,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.207),
                    Text(
                      'Approved',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.090),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined,
                          size: 26, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.014),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.158,
                  ),
                  Text(
                    employeeName,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Badge',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  Text(
                    badgeno,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Dept/Div',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.117,
                  ),
                  Text(
                    department,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Position',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.126,
                  ),
                  Text(
                    Positions,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 12, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Destination',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.077,
                  ),
                  Text(
                    request?.destination ?? 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Departure Date',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.019,
                  ),
                  Text(
                    request?.departureDate != null
                        ? DateFormat('dd/MM/yyyy')
                        .format(request!.departureDate!.getDateTimeInUtc().toLocal())
                        : 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.016,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Text(
                    'Arrival Date',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.071,
                  ),
                  Text(
                    request!.arrivalDate != null
                        ? DateFormat('dd/MM/yyyy')
                        .format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                        : 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.024),
              Row(
                children: [
                  SizedBox(width: size.width * 0.26),
                  MaterialButton(
                    minWidth: size.width * 0.22,
                    height: size.height * 0.04,
                    onPressed: () {
                      _showTicketApprovedCancelDialog(context, request);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                    ),
                    color: Colors.yellow,
                    textColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.025),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  //ticket rejected dialog
  void _ticketrejectedDialog(BuildContext context,int rowIndex,TicketRequest request ) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.260,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height:  size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.110),
                    Text(
                      'Rejected',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.055),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined, size: 26, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.018),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.057,),
                  Text(employeeName.isNotEmpty ? employeeName : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.055,),
                  Text(badgeno.isNotEmpty ? badgeno : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.044,),
                  Text(department.isNotEmpty ? department : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Position',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.047,),
                  Text(Positions.isNotEmpty ? Positions : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Destination',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.032,),
                  Text( request?.destination ?? 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Departure Date',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.015,),
                  Text(request?.departureDate != null
                      ? DateFormat('dd/MM/yyyy').format(request!.departureDate!.getDateTimeInUtc().toLocal())
                      : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Arrival Date',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.032,),
                  Text(request!.arrivalDate != null
                      ? DateFormat('dd/MM/yyyy').format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                      : 'N/A' ,style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.022),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.050,),
                  Text('Remarks',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                  SizedBox(width:size.width *  0.0455,),
                  Container(
                    width: size.width * 0.10,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: grey,width: 1)
                    ),
                    child: Text('  ${request.hrRemarks}' ?? '',style: TextStyle(color: black,fontSize: 14,fontFamily: 'Inter'),),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.030),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _tabticketrejectedDialog(BuildContext context, int rowIndex, TicketRequest request) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.4,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height:  size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.165),
                    Text(
                      'Rejected',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.090),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined, size: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.020),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.065,),
                  Text('Name',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.082,),
                  Text(employeeName.isNotEmpty ? employeeName: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.065,),
                  Text('Badge',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.079,),
                  Text(badgeno.isNotEmpty ? badgeno: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.065,),
                  Text('Dept/Div',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.066,),
                  Text(department.isNotEmpty ? department: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.065,),
                  Text('Position',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.068,),
                  Text(Positions.isNotEmpty ? Positions: 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 13,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.065,),
                  Text('Destination',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.050,),
                  Text(request?.destination ?? 'Unknown',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.065,),
                  Text('Departure Date',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.026,),
                  Text(request?.departureDate != null
                      ? DateFormat('dd/MM/yyyy').format(request!.departureDate!.getDateTimeInUtc().toLocal())
                      : 'N/A',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.065,),
                  Text('Arrival Date',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.045,),
                  Text(request!.arrivalDate != null
                      ? DateFormat('dd/MM/yyyy').format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                      : 'N/A' ,style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                ],
              ),
              SizedBox(height: size.height * 0.022),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:size.width *  0.062,),
                  Text('Comments',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black),),
                  SizedBox(width:size.width *  0.050,),
                  Container(
                    width: size.width * 0.175,
                    height: size.height * 0.057,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: grey,width: 1)
                    ),
                    child: Text( ' ${request.hrRemarks}' ?? "" ,style: TextStyle(color: black,fontSize: 12,fontFamily: 'Inter'),),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.028),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void _phoneticketrejectedDialog(
      BuildContext context, int rowIndex, TicketRequest request) {
    final Size size = MediaQuery.of(context).size;
    Get.dialog(
      Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          width: size.width * 0.76,
          decoration: BoxDecoration(
            color: dialog,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: size.height * 0.057,
                color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width * 0.210),
                    Text(
                      'Rejected',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(width: size.width * 0.14),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.cancel_outlined,
                          size: 26, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.014),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.157,
                  ),
                  Text(
                    employeeName,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Badge',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  Text(
                    badgeno,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Dept/Div',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    department,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Position',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.13,
                  ),
                  Text(
                    Positions,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 12, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Destination',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.078,
                  ),
                  Text(
                    request?.destination ?? 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Departure Date',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.016,
                  ),
                  Text(
                    request?.departureDate != null
                        ? DateFormat('dd/MM/yyyy')
                        .format(request!.departureDate!.getDateTimeInUtc().toLocal())
                        : 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Arrival Date',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.063,
                  ),
                  Text(
                    request!.arrivalDate != null
                        ? DateFormat('dd/MM/yyyy')
                        .format(request.arrivalDate!.getDateTimeInUtc().toLocal())
                        : 'N/A',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.022),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Remarks',
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 13, color: black),
                  ),
                  SizedBox(
                    width: size.width * 0.11,
                  ),
                  Container(
                    width: size.width * 0.34,
                    height: size.height * 0.043,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: grey, width: 1)),
                    child: Text(
                      request.hrRemarks ?? '',
                      style: TextStyle(
                          color: black, fontSize: 14, fontFamily: 'Inter'),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.030),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  // Filtered leave data based on date range

  Future<void> fetchLeaveDetails(BuildContext context) async {
    try {
      final box = GetStorage();
      String empId = box.read('userId') ?? '';
      print('Fetched empID: $empId');

      if (empId.isEmpty) return;

      final request = ModelQueries.list(EmpLeaveDetails.classType);
      final response = await Amplify.API.query(request: request).response;

      if (response.errors.isNotEmpty) {
        print('Errors: ${response.errors}');
        return;
      }

      List<EmpLeaveDetails?> employeeInfos = (response.data?.items as List?)?.cast<EmpLeaveDetails?>() ?? [];

      if (employeeInfos.isNotEmpty) {
        EmpLeaveDetails? employeeInfo = employeeInfos.firstWhere(
              (e) => e?.empID == empId,
          orElse: () => null,
        );
        print(employeeInfo);

        if (employeeInfo != null) {
          // Store everything as String in GetStorage
          box.write('annualLeave', (employeeInfo.annualLeave?.isNotEmpty ?? false) ? employeeInfo.annualLeave!.join(', ') : '0');
          box.write('sickLeave', employeeInfo.sickLeave?.toString() ?? '0');
          box.write('paterLeave', (employeeInfo.paterLeave?.isNotEmpty ?? false) ? employeeInfo.paterLeave!.join(', ') : '0');
          box.write('materLeave', (employeeInfo.materLeave?.isNotEmpty ?? false) ? employeeInfo.materLeave!.join(', ') : '0');
          box.write('mrageLeave', employeeInfo.mrageLeave ?? '0');
          box.write('compasLeave', employeeInfo.compasLeave ?? '0');

          setState(() {
            annualLeave = box.read('annualLeave') ?? '0';
            sickLeave = box.read('sickLeave') ?? '0';
            paterLeave = box.read('paterLeave') ?? '0';
            materLeave = box.read('materLeave') ?? '0';
            mrageLeave = box.read('mrageLeave') ?? '0';
            compasLeave = box.read('compasLeave') ?? '0';
          });
        } else {
          print('No matching work data found for user: $empId');
        }
      } else {
        print('No work data found.');
      }
    } catch (e) {
      print('Failed to fetch empworkinfo: $e');
    }
  }

  Future<void> fetchEmployWorkInfo(BuildContext context) async {
    try {
      final box = GetStorage();
      String empId = box.read('userId') ?? '';
      print('Fetched empID: $empId');

      if (empId.isEmpty) return;

      final request = ModelQueries.list(EmpWorkInfo.classType);
      final response = await Amplify.API.query(request: request).response;
      // print(response);

      if (response.errors.isNotEmpty) {
        print('Errors: ${response.errors}');
        return;
      }

      List<EmpWorkInfo?> employeeInfos = (response.data?.items as List?)?.cast<EmpWorkInfo?>() ?? [];

      if (employeeInfos.isNotEmpty) {
        EmpWorkInfo? employeeInfo = employeeInfos.firstWhere(
              (e) => e?.empID == empId,
          orElse: () => null,
        );
        print(employeeInfo);

        if (employeeInfo != null) {
          // Store the fetched employee data in GetStorage
          box.write('doj', employeeInfo.doj ?? 'N/A');
          box.write('department', (employeeInfo.department?.isNotEmpty ?? false) ? employeeInfo.department!.join(', ') : 'N/A');
          box.write('position', (employeeInfo.position?.isNotEmpty ?? false) ? employeeInfo.position!.join(', ') : 'N/A');
          box.write('manager', (employeeInfo.manager?.isNotEmpty ?? false) ? employeeInfo.manager!.join(', ') : 'N/A');
          box.write('supervisor', (employeeInfo.supervisor?.isNotEmpty ?? false) ? employeeInfo.supervisor!.join(', ') : 'N/A');
          box.write('hr', (employeeInfo.hr?.isNotEmpty ?? false) ? employeeInfo.hr!.join(', ') : 'N/A');
          setState(() {
            final storedDoj = box.read('doj') ?? 'N/A';
            doj = storedDoj != 'N/A' && storedDoj.isNotEmpty
                ? DateFormat('dd/MM/yyyy').format(DateTime.parse(storedDoj))
                : 'N/A';
            department = box.read('department') ?? 'N/A';
            Positions = box.read('position') ?? 'N/A';
            hr = box.read('hr') ?? 'N/A';
            manager = box.read('manager') ?? 'N/A';
            supervisor = box.read('supervisor') ?? 'N/A';
          });

        }
        else {
          print('No matching work data found for user: $empId');

        }
      } else {
        print('No work data found.');

      }
    } catch (e) {
      print('Failed to fetch  empworkinfo: $e');

    }
  }

  String normalizeName(String name) {
    return name.toLowerCase().replaceAll(RegExp(r'\s+'), '');
  }

  void fetchManagerSupervisorHRInfo(List<EmpPersonalInfo?> employeeInfos, GetStorage box) {
    String storedManagerName = normalizeName(box.read('manager') ?? '');
    String storedSupervisorName = normalizeName(box.read('supervisor') ?? '');
    String storedHRName = normalizeName(box.read('hr') ?? '');

    // Find emails and IDs based on normalized names
    EmpPersonalInfo? managerInfo = employeeInfos.firstWhere(
          (e) => e != null && normalizeName(e.name ?? '') == storedManagerName,
      orElse: () => null,
    );
    EmpPersonalInfo? supervisorInfo = employeeInfos.firstWhere(
          (e) => e != null && normalizeName(e.name ?? '') == storedSupervisorName,
      orElse: () => null,
    );
    EmpPersonalInfo? hrInfo = employeeInfos.firstWhere(
          (e) => e != null && normalizeName(e.name ?? '') == storedHRName,
      orElse: () => null,
    );

    // Store emails and IDs in GetStorage
    box.write('managerEmail', managerInfo?.email ?? 'N/A');
    box.write('supervisorEmail', supervisorInfo?.email ?? 'N/A');
    box.write('hrEmail', hrInfo?.email ?? 'N/A');
    box.write('managerName', managerInfo?.name ?? 'N/A');
    box.write('supervisorName', supervisorInfo?.name ?? 'N/A');
    box.write('hrName', hrInfo?.name ?? 'N/A');
    box.write('supervisorEmpID', supervisorInfo?.empID ?? '');
    box.write('managerEmpID', managerInfo?.empID ?? '');

    // Debug print
    print('${managerInfo?.name ?? 'N/A'}: ${managerInfo?.email ?? 'N/A'} : ${managerInfo?.empID ?? 'N/A'} ');
    print('${supervisorInfo?.name ?? 'N/A'}: ${supervisorInfo?.email ?? 'N/A'} :${supervisorInfo?. empID?? 'N/A'} ');
    print('${hrInfo?.name ?? 'N/A'}: ${hrInfo?.email ?? 'N/A'}');
  }

  Future<void> fetchEmployeePersonalInfo(BuildContext context) async {
    try {
      final box = GetStorage();
      String empId = box.read('userId') ?? '';

      if (empId.isEmpty) return;

      final request = ModelQueries.list(EmpPersonalInfo.classType);
      final response = await Amplify.API.query(request: request).response;

      if (response.errors.isNotEmpty) {
        print('Errors: ${response.errors}');
        return;
      }

      List<EmpPersonalInfo?> employeeInfos = (response.data?.items as List?)?.cast<EmpPersonalInfo?>() ?? [];

      if (employeeInfos.isNotEmpty) {
        EmpPersonalInfo? employeeInfo = employeeInfos.firstWhere(
              (e) => e?.empID == empId,
          orElse: () => null,
        );

        if (employeeInfo != null) {
          String profilePhotoUrl = employeeInfo.profilePhoto ?? '';
          box.write('name', employeeInfo.name ?? 'N/A');
          box.write('email', employeeInfo.email ?? 'N/A');
          box.write('contactNo', (employeeInfo.contactNo?.isNotEmpty ?? false) ? employeeInfo.contactNo!.join(', ') : 'N/A');
          box.write('badgeNo', employeeInfo.empBadgeNo ?? 'N/A');
          box.write('image', profilePhotoUrl);
          box.write('emptype', (employeeInfo.empType?.isNotEmpty ?? false) ? employeeInfo.empType!.join(', ') : 'N/A');
          box.write('gender', employeeInfo.gender ?? 'N/A');

          setState(() {
            employeeName = box.read('name') ?? 'N/A';
            employeeEmail = box.read('email') ?? 'N/A';
            contactNo = box.read('contactNo') ?? 'N/A';
            badgeno = box.read('badgeNo') ?? 'N/A';
            image = box.read('image') ?? 'N/A';
            empType = box.read('emptype') ?? 'N/A';
          });

          // Fetch manager, supervisor, and HR details
          fetchManagerSupervisorHRInfo(employeeInfos, box);
        } else {
          print('No matching employee data found for user: $empId');
        }
      } else {
        print('No employee data found.');
      }
    } catch (e) {
      print('Failed to fetch employee personal info: $e');
    }
  }



  Future<void> fetchEmailNotifications(BuildContext context) async {
    try {
      // Retrieve the employee email from local storage
      String employeeEmail = box.read('email') ?? '';

      if (employeeEmail.isEmpty) {
        print('No employee email found.');
        return;
      }

      // Query the EmailNotifi model
      final request = ModelQueries.list(EmailNotifi.classType);
      final response = await Amplify.API.query(request: request).response;

      // Handle potential API errors
      if (response.errors.isNotEmpty) {
        print('Errors: ${response.errors}');
        return;
      }

      // Extract email notifications
      List<EmailNotifi?> emailNotifications =
          (response.data?.items as List?)?.cast<EmailNotifi?>() ?? [];

      // Filter notifications for the current employee
      List<Map<String, String>> filteredMessages = emailNotifications.where((notification) {
        return notification?.receipentEmail == employeeEmail;
      }).map((notification) {
        final message = notification?.message ?? 'No message';

        // Convert TemporalDateTime to DateTime
        final createdAt = notification?.createdAt;
        DateTime dateTime = createdAt?.getDateTimeInUtc() ?? DateTime.now();

        // Convert UTC to local time
        dateTime = dateTime.toLocal();

        // Format date and time
        String date = '${dateTime.day}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
        String time = '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

        return {
          'message': message,
          'date': date,
          'time': time,
          'createdAt': dateTime.toIso8601String(), // Use ISO-8601 for consistency
        };
      }).toList();

      // Sort messages by 'createdAt' in descending order
      filteredMessages.sort((a, b) {
        DateTime dateA = DateTime.parse(a['createdAt']!);
        DateTime dateB = DateTime.parse(b['createdAt']!);
        return dateB.compareTo(dateA);
      });

      // Update the UI state with filtered messages
      if (mounted) {
        setState(() {
          messageList = filteredMessages;
          unreadMessages = filteredMessages.length;
        });
      }

      if (filteredMessages.isEmpty) {
        print('No email notifications found for the employee.');
      }
    } catch (e) {
      print('Failed to fetch email notifications: $e');
    }
  }



  void _showAlertDialog(String title, String content) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
  @override
  void initState() {
    super.initState();
    initializeData(); // Separate method to handle all async initializations
    _checkUserSession();
    from.addListener(() {
      _checkAndResetFilter();
    });
    to.addListener(() {
      _checkAndResetFilter();
    });
  }

  Future<void> initializeData() async {
    // Wait for all data-fetching functions to complete
    await Future.wait([
      fetchEmailNotifications(context),
      fetchLeaveData(),
      fetchTicketRequests(),
      fetchUpdatedEmployeeInfo(context),
      fetchEmployeePersonalInfo(context),
      fetchEmployWorkInfo(context),
      fetchLeaveDetails(context),

    ]);


    if (mounted) {
      CalculateLeaveData();
    }
  }

  @override
  void dispose() {
    from.dispose();
    to.dispose();
    super.dispose();
  }


  void _checkAndResetFilter() {
    if (from.text.isEmpty && to.text.isEmpty) {
      filterLeaveData(); // Call your function to load all data
    }
  }

  Future<void> _checkUserSession() async {
    var session = await Amplify.Auth.fetchAuthSession();
    if (!session.isSignedIn) {
      // Navigate to login screen if not signed in
      Get.off(() => LoginScreen());
    }
  }

  //Notification part for cancelling leave and ticket

  Future<bool> sendCancelEmail(String managerEmail, String employeeName) async {
    // Create an instance of the AWS SES client
    final awsCredentials = AwsClientCredentials(
      accessKey: 'AKIAQXPZCWE7ZED5EI2A', // Replace with your AWS access key
      secretKey: 'LJwP2fd40b8OZoY28/0iLWr5op3eDTUZK7ugNcD3', // Replace with your AWS secret key
    );

    final ses = SES(
      region: 'ap-southeast-1', // e.g., 'us-east-1'
      credentials: awsCredentials,
    );


    final messageBody = 'Employee $employeeName has canceled their leave request.\n'
        'You can view the details here: https://dev.dxtlxvdrz6jj5.amplifyapp.com';
    final subject = 'Leave Cancellation Notification';

    try {
      // Send an email to the manager's email
      await ses.sendEmail(
        destination: Destination(toAddresses: [managerEmail]),
        message: Message(
          subject: Content(data: subject),
          body: Body(text: Content(data: messageBody)),
        ),
        source: 'leave_no-reply@adininworks.com', // Replace with a verified email address in SES
      );

      print('Email sent to $managerEmail');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  Future<bool> ticketCancelEmail(String hrEmail, String employeeName) async {
    // Create an instance of the AWS SES client
    final awsCredentials = AwsClientCredentials(
      accessKey: 'AKIAQXPZCWE7ZED5EI2A', // Replace with your AWS access key
      secretKey: 'LJwP2fd40b8OZoY28/0iLWr5op3eDTUZK7ugNcD3', // Replace with your AWS secret key
    );

    final ses = SES(
      region: 'ap-southeast-1', // e.g., 'us-east-1'
      credentials: awsCredentials,
    );


    final messageBody = 'Employee $employeeName has canceled their ticket request.\n'
        'You can view the details here: https://dev.dxtlxvdrz6jj5.amplifyapp.com';
    final subject = 'Ticket Cancellation Notification';

    try {
      // Send an email to the manager's email
      await ses.sendEmail(
        destination: Destination(toAddresses: [hrEmail]),
        message: Message(
          subject: Content(data: subject),
          body: Body(text: Content(data: messageBody)),
        ),
        source: 'leave_no-reply@adininworks.com', // Replace with a verified email address in SES
      );

      print('Email sent to $hrEmail');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  Future<void> updateEmailNotificationStatus(
      String empID, String newStatus, String newMessage, String recipientEmail) async {
    try {
      final normalizedEmail = recipientEmail.toLowerCase();
      print('Querying EmailNotifi with empID: $empID and recipientEmail: $normalizedEmail');

      // Adjust the query to search for the email inside the list of recipient emails
      final request = ModelQueries.list<EmailNotifi>(
        EmailNotifi.classType,
        where: EmailNotifi.EMPID.eq(empID).and(EmailNotifi.RECEIPENTEMAIL.contains(normalizedEmail)),
      );

      final response = await Amplify.API.query(request: request).response;

      if (response.errors.isNotEmpty) {
        print('Query Errors: ${response.errors}');
        return;
      }

      if (response.data != null && response.data!.items.isNotEmpty) {
        // If a matching EmailNotifi is found
        final emailNotification = response.data!.items.first!;

        // Update the notification with new status and message
        final updatedEmailNotification = emailNotification.copyWith(
          status: newStatus,
          message: newMessage,
        );

        print('Updating EmailNotifi: $updatedEmailNotification');
        final updateRequest = ModelMutations.update(updatedEmailNotification);
        final updateResponse = await Amplify.API.mutate(request: updateRequest).response;

        if (updateResponse.errors.isEmpty && updateResponse.data != null) {
          print('Email notification status updated successfully for $normalizedEmail');
        } else {
          print('Failed to update email notification: ${updateResponse.errors}');
        }
      } else {
        print('No matching EmailNotifi found for $normalizedEmail. No update performed.');
      }
    } catch (e) {
      print('Exception while updating email notification status: $e');
    }
  }


  Future<bool> approvedCancelEmail(String managerEmail, String employeeName) async {
    // Create an instance of the AWS SES client
    final awsCredentials = AwsClientCredentials(
      accessKey: 'AKIAQXPZCWE7ZED5EI2A', // Replace with your AWS access key
      secretKey: 'LJwP2fd40b8OZoY28/0iLWr5op3eDTUZK7ugNcD3', // Replace with your AWS secret key
    );

    final ses = SES(
      region: 'ap-southeast-1', // e.g., 'us-east-1'
      credentials: awsCredentials,
    );


    final messageBody = 'Employee $employeeName has canceled their approved leave.\n'
        'You can view the details here: https://dev.dxtlxvdrz6jj5.amplifyapp.com';
    final subject = 'Approved Leave Cancellation Notification';

    try {
      // Send an email to the manager's email
      await ses.sendEmail(
        destination: Destination(toAddresses: [managerEmail]),
        message: Message(
          subject: Content(data: subject),
          body: Body(text: Content(data: messageBody)),
        ),
        source: 'leave_no-reply@adininworks.com', // Replace with a verified email address in SES
      );

      print('Email sent to $managerEmail');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  Future<bool> ticketApprovedCancelEmail(String hrEmail , String employeeName) async {
    // Create an instance of the AWS SES client
    final awsCredentials = AwsClientCredentials(
      accessKey: 'AKIAQXPZCWE7ZED5EI2A', // Replace with your AWS access key
      secretKey: 'LJwP2fd40b8OZoY28/0iLWr5op3eDTUZK7ugNcD3', // Replace with your AWS secret key
    );

    final ses = SES(
      region: 'ap-southeast-1', // e.g., 'us-east-1'
      credentials: awsCredentials,
    );


    final messageBody = 'Employee $employeeName has canceled their approved leave.\n'
        'You can view the details here: https://dev.dxtlxvdrz6jj5.amplifyapp.com';
    final subject = 'Approved ticket Cancellation Notification';

    try {
      // Send an email to the manager's email
      await ses.sendEmail(
        destination: Destination(toAddresses: [hrEmail]),
        message: Message(
          subject: Content(data: subject),
          body: Body(text: Content(data: messageBody)),
        ),
        source: 'leave_no-reply@adininworks.com', // Replace with a verified email address in SES
      );

      print('Email sent to $hrEmail');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  void _showPendingCancelDialog(BuildContext context, LeaveStatus leave) {
    final managerEmail = box.read('managerEmail') ?? 'N/A';
    final supervisorEmail = box.read('supervisorEmail') ?? 'N/A';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm?"),
          content: Text("Do you want to cancel this pending leave request?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("No", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close the dialog

                // Proceed with cancellation
                bool success = await updateLeaveStatus(leave);
                Get.back();

                if (success) {
                  _showAlertDialog('Success', 'Leave request cancelled successfully.');
                  CalculateLeaveData();

                  // Send cancellation emails and update EmailNotifi
                  if (leave.applyTo!.contains('Supervisor') && supervisorEmail != 'N/A') {
                    bool emailSent = await sendCancelEmail(supervisorEmail, employeeName);
                    if (emailSent) {
                      print('Email successfully sent to supervisor: $supervisorEmail');
                      await updateEmailNotificationStatus(leave.empID,  'Cancelled', 'Leave request cancelled by ${employeeName}',supervisorEmail);
                    } else {
                      print('Failed to send email to supervisor: $supervisorEmail');
                    }
                  }

                  if (leave.applyTo!.contains('Manager') && managerEmail != 'N/A') {
                    bool emailSent = await sendCancelEmail(managerEmail, employeeName);
                    if (emailSent) {
                      print('Email successfully sent to manager: $managerEmail');
                      await updateEmailNotificationStatus(leave.empID,  'Cancelled','Leave request cancelled by ${employeeName}',managerEmail);
                    } else {
                      print('Failed to send email to manager: $managerEmail');
                    }
                  }
                } else {
                  _showAlertDialog('Failed', 'Failed to cancel leave request.');
                }
              },
              child: Text("Yes", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }


  void _showApprovedCancelDialog(BuildContext context, LeaveStatus leave,) {
    final managerEmail =box.read('managerEmail') ?? 'N/A';
    final supervisorEmail = box.read('supervisorEmail') ?? 'N/A';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm?"),
          content: Text("Do you want to cancel the approved leave?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("No", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close the dialog
                // Proceed with cancellation
                bool success = await updateLeaveStatus(leave);
                Get.back();

                if (success) {
                  _showAlertDialog('Success', 'Approved leave cancelled Succesfully.');
                  CalculateLeaveData();

                  if (leave.applyTo!.contains('Supervisor') && supervisorEmail != 'N/A') {
                    bool emailSent = await approvedCancelEmail(supervisorEmail,employeeName);
                    if (emailSent) {
                      print('Email successfully sent to supervisor: $supervisorEmail');
                      await updateEmailNotificationStatus(leave.empID,  'Cancelled', 'Approved leave cancelled by ${employeeName}',supervisorEmail);
                    } else {
                      print('Failed to send email to supervisor: $supervisorEmail');
                    }
                  }

                  // Check if email should be sent to the manager
                  if (leave.applyTo!.contains('Manager') && managerEmail != 'N/A') {
                    bool emailSent = await approvedCancelEmail(managerEmail,employeeName);
                    if (emailSent) {
                      print('Email successfully sent to manager: $managerEmail');
                      await updateEmailNotificationStatus(leave.empID,  'Cancelled','Approved leave cancelled by ${employeeName}',managerEmail);
                    } else {
                      print('Failed to send email to manager: $managerEmail');
                    }
                  }
                } else {
                  // Show failure message for leave cancellation
                  _showAlertDialog('Failed', 'Failed to cancel Approved leave.');
                }
              },
              child: Text("Yes", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  void _showTicketPendingCancelDialog(BuildContext context, TicketRequest request) {
    final hrEmail = box.read('hrEmail') ?? 'N/A';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm?"),
          content: Text("Do you want to cancel this  Ticket request?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("No", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close the dialog
                // Proceed with cancellation
                bool success = await updateTicketStatus(request);
                Get.back();

                if (success) {
                  _showAlertDialog('Success', 'Ticket request cancelled Succesfully.');
                  bool emailSent= await ticketCancelEmail(hrEmail, employeeName);
                  if(emailSent){
                    print('Email successfully sent to hr: $hrEmail');
                    await updateEmailNotificationStatus(request.empID, 'Cancelled', 'Ticket request cancelled by ${employeeName}', hrEmail);
                  }
                  else {
                    print('Failed to send email to hr: $hrEmail');
                  }
                } else {
                  _showAlertDialog('Failed', 'Failed to cancelled ticket request.');
                }
              },
              child: Text("Yes", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  void _showTicketApprovedCancelDialog(BuildContext context, TicketRequest request) {
    final hrEmail = box.read('hrEmail') ?? 'N/A';
    final empId=box.read('userId') ?? 'N/A';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm?"),
          content: Text("Do you want to cancel the approved Ticket?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("No", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close the dialog
                // Proceed with cancellation
                bool success = await updateTicketStatus(request);
                Get.back();

                if (success) {
                  _showAlertDialog('Success', 'Approved Ticket request cancelled Succesfully.');
                  bool emailSent= await sendTicketEmail(hrEmail, employeeName);
                  if(emailSent){
                    print('Email successfully sent to hr: $hrEmail');
                    await updateEmailNotificationStatus(request.empID, 'Cancelled', ' Approved Ticket request cancelled by ${employeeName}', hrEmail);
                  }
                  else {
                    print('Failed to send email to hr: $hrEmail');
                  }
                } else {
                  _showAlertDialog('Failed', 'Failed to cancelled ticket request.');
                }
              },
              child: Text("Yes", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  // leave dialog based on status
  void _showLeaveDialog(BuildContext context, int index, LeaveStatus leave) {
    // Check if the leave has been cancelled; do nothing if true
    if (leave.empStatus?.toLowerCase() == 'cancelled') {
      return; // Exit if leave is cancelled
    }

    // Show the appropriate dialog based on supervisor and manager statuses
    if (leave.managerStatus == 'Approved') {
      // Manager approved; show the approved dialog
      _approvedDialog(context, index, leave);
    } else if (leave.managerStatus == 'Rejected') {
      // Manager rejected; show the rejected dialog
      _rejectedDialog(context, index, leave);
    } else if (leave.supervisorStatus == 'Rejected') {
      // Supervisor rejected; show the rejected dialog
      _rejectedDialog(context, index, leave);
    } else {
      // If both are still pending or supervisor approved but manager is pending
      _pendingDialog(context, index, leave);
    }
  }

  void _showtabLeaveDialog(BuildContext context, int index, LeaveStatus leave) {
    // Check if the leave has been cancelled; do nothing if true
    if (leave.empStatus?.toLowerCase() == 'cancelled') {
      return; // Exit if leave is cancelled
    }

    // Show the appropriate dialog based on supervisor and manager statuses
    if (leave.managerStatus == 'Approved') {
      // Manager approved; show the approved dialog
      _tabapprovedDialog(context, index, leave);
    } else if (leave.managerStatus == 'Rejected') {
      // Manager rejected; show the rejected dialog
      _tabrejectedDialog(context, index, leave);
    } else if (leave.supervisorStatus == 'Rejected') {
      // Supervisor rejected; show the rejected dialog
      _tabrejectedDialog(context, index, leave);
    } else {
      // If both are still pending or supervisor approved but manager is pending
      _tabpendingDialog(context, index, leave);
    }
  }

  void _showphoneLeaveDialog(BuildContext context, int index, LeaveStatus leave) {
    // Show the appropriate dialog based on leave status
    if (leave.empStatus?.toLowerCase() == 'cancelled') {
      return; // Exit if leave is cancelled
    }

    // Show the appropriate dialog based on supervisor and manager statuses
    if (leave.managerStatus == 'Approved') {
      // Manager approved; show the approved dialog
      _phoneapprovedDialog(context, index, leave);
    } else if (leave.managerStatus == 'Rejected') {
      // Manager rejected; show the rejected dialog
      _phonerejectedDialog(context, index, leave);
    } else if (leave.supervisorStatus == 'Rejected') {
      // Supervisor rejected; show the rejected dialog
      _phonerejectedDialog(context, index, leave);
    } else {
      // If both are still pending or supervisor approved but manager is pending
      _phonependingDialog(context, index, leave);
    }
  }

  //ticket dialog based on status
  void _showTicketDialog(BuildContext context, int index, TicketRequest request) {
    if (request.empStatus?.toLowerCase() == 'cancelled') {
      return; // Exit if leave is cancelled
    }
    // Show the appropriate dialog based on leave status
    if (request.hrStatus == 'Approved') {
      _ticketapprovedDialog(context, index, request);
    } else if (request.hrStatus == 'Rejected') {
      _ticketrejectedDialog(context, index, request);
    } else {
      _ticketpendingDialog(context, index, request);
    }
  }

  void _showtabTicketDialog(BuildContext context, int index, TicketRequest request) {
    if (request.empStatus?.toLowerCase() == 'cancelled') {
      return; // Exit if leave is cancelled
    }
    // Show the appropriate dialog based on leave status
    if (request.hrStatus == 'Approved') {
      _tabticketapprovedDialog(context, index, request);
    } else if (request.hrStatus == 'Rejected') {
      _tabticketrejectedDialog(context, index, request);
    } else {
      _tabticketpendingDialog(context, index, request);
    }
  }

  void _showphoneTicketDialog(BuildContext context, int index, TicketRequest request) {
    // Show the appropriate dialog based on leave status
    if (request.empStatus?.toLowerCase() == 'cancelled') {
      return; // Exit if leave is cancelled
    }
    // Show the appropriate dialog based on leave status
    if (request.hrStatus == 'Approved') {
      _phoneticketapprovedDialog(context, index, request);
    } else if (request.hrStatus == 'Rejected') {
      _phoneticketrejectedDialog(context, index, request);
    } else {
      _phoneticketpendingDialog(context, index, request);
    }
  }



  bool isRecentLeaveSelected = true; // Tracks the selected tab

  void _toggleTab(bool isRecent) {
    setState(() {
      isRecentLeaveSelected = isRecent;
    });
  }
  // Function to calculate leave values
  Map<String, int> calculateLeaveValues(List<LeaveStatus> leaveList) {
    int totalAnnualLeave = int.tryParse(annualLeave) ?? 0;
    int totalSickLeave = int.tryParse(sickLeave) ?? 0;
    int totalMaternityLeave = int.tryParse(materLeave) ?? 91;
    int totalPaternityLeave = int.tryParse(paterLeave) ?? 2;
    int totalMarriageLeave = int.tryParse(mrageLeave) ?? 1;
    int totalCompassionateLeave = int.tryParse(compasLeave) ?? 2;
    int unpaidAuthorize = 0;

    int annualLeaveTaken = 0;
    int sickLeaveTaken = 0;
    int maternityLeaveTaken = 0;
    int paternityLeaveTaken = 0;
    int marriageLeaveTaken = 0;
    int compassionateLeaveTaken = 0;

    int annualLeaveRequests = 0;
    int sickLeaveRequests = 0;
    int maternityLeaveRequests = 0;
    int paternityLeaveRequests = 0;
    int marriageLeaveRequests = 0;
    int compassionateLeaveRequests = 0;

    int annualLeaveRemaining = totalAnnualLeave;
    int sickLeaveRemaining = totalSickLeave;
    int maternityLeaveRemaining = totalMaternityLeave;
    int paternityLeaveRemaining = totalPaternityLeave;
    int marriageLeaveRemaining = totalMarriageLeave;
    int compassionateLeaveRemaining = totalCompassionateLeave;

    for (var leave in leaveList) {
      if (leave.empStatus == 'Pending') {
        String effectiveLeaveType = leave.leaveType;

        // Compassionate leave handling when compassionate leave is exhausted
        if (compassionateLeaveRemaining <= 0 && leave.leaveType == 'Compassionate Leave') {
          // Treat exhausted compassionate leave as annual leave
          effectiveLeaveType = 'Annual Leave';
        }

        if (leave.supervisorStatus == 'Pending' && leave.managerStatus == 'Pending') {
          switch (effectiveLeaveType) {
            case 'Annual Leave':
              annualLeaveRequests++;
              break;
            case 'Sick Leave':
            case 'Hospitalisation Leave':
              sickLeaveRequests++;
              break;
            case 'Maternity Leave':
              maternityLeaveRequests++;
              break;
            case 'Paternity Leave':
              paternityLeaveRequests++;
              break;
            case 'Marriage Leave':
              marriageLeaveRequests++;
              break;
            case 'Compassionate Leave':
              compassionateLeaveRequests++;
              break;
          }
        }

        if (leave.empStatus == 'Cancelled' && leave.supervisorStatus == 'Pending' && leave.managerStatus == 'Pending') {
          switch (effectiveLeaveType) {
            case 'Annual Leave':
              annualLeaveRequests--;
              break;
            case 'Sick Leave':
            case 'Hospitalisation Leave':
              sickLeaveRequests--;
              break;
            case 'Maternity Leave':
              maternityLeaveRequests--;
              break;
            case 'Paternity Leave':
              paternityLeaveRequests--;
              break;
            case 'Marriage Leave':
              marriageLeaveRequests--;
              break;
            case 'Compassionate Leave':
              compassionateLeaveRequests--;
              break;
          }
        }

        if (leave.empStatus == 'Pending' && leave.supervisorStatus == 'Rejected' && leave.managerStatus == 'Pending') {
          switch (effectiveLeaveType) {
            case 'Annual Leave':
              annualLeaveRequests--;
              break;
            case 'Sick Leave':
            case 'Hospitalisation Leave':
              sickLeaveRequests--;
              break;
            case 'Maternity Leave':
              maternityLeaveRequests--;
              break;
            case 'Paternity Leave':
              paternityLeaveRequests--;
              break;
            case 'Marriage Leave':
              marriageLeaveRequests--;
              break;
            case 'Compassionate Leave':
              compassionateLeaveRequests--;
              break;
          }
        }

        if (leave.empStatus == 'Pending' && leave.supervisorStatus == 'Pending' && leave.managerStatus == 'Rejected') {
          switch (effectiveLeaveType) {
            case 'Annual Leave':
              annualLeaveRequests--;
              break;
            case 'Sick Leave':
            case 'Hospitalisation Leave':
              sickLeaveRequests--;
              break;
            case 'Maternity Leave':
              maternityLeaveRequests--;
              break;
            case 'Paternity Leave':
              paternityLeaveRequests--;
              break;
            case 'Marriage Leave':
              marriageLeaveRequests--;
              break;
            case 'Compassionate Leave':
              compassionateLeaveRequests--;
              break;
          }
        }

        // Handling approved leave requests by supervisor and manager
        if (leave.empStatus == 'Pending' && leave.supervisorStatus == 'Approved' && leave.managerStatus == 'Approved') {
          switch (effectiveLeaveType) {
            case 'Annual Leave':
              annualLeaveTaken += leave.days?.toInt() ?? 0;
              annualLeaveRemaining -= leave.days?.toInt() ?? 0;
              break;
            case 'Sick Leave':
            case 'Hospitalisation Leave':
              sickLeaveTaken += leave.days?.toInt() ?? 0;
              sickLeaveRemaining -= leave.days?.toInt() ?? 0;
              break;
            case 'Maternity Leave':
              maternityLeaveTaken += leave.days?.toInt() ?? 0;
              maternityLeaveRemaining -= leave.days?.toInt() ?? 0;
              break;
            case 'Paternity Leave':
              paternityLeaveTaken += leave.days?.toInt() ?? 0;
              paternityLeaveRemaining -= leave.days?.toInt() ?? 0;
              break;
            case 'Marriage Leave':
              marriageLeaveTaken += leave.days?.toInt() ?? 0;
              marriageLeaveRemaining -= leave.days?.toInt() ?? 0;
              break;
            case 'Compassionate Leave':
              compassionateLeaveTaken += leave.days?.toInt() ?? 0;
              compassionateLeaveRemaining -= leave.days?.toInt() ?? 0;
              break;
          }
        }

        if (leave.empStatus == 'Cancelled' && leave.managerStatus == 'Approved') {
          switch (effectiveLeaveType) {
            case 'Annual Leave':
              annualLeaveTaken -= leave.days?.toInt() ?? 0;
              annualLeaveRemaining += leave.days?.toInt() ?? 0;
              break;
            case 'Sick Leave':
            case 'Hospitalisation Leave':
              sickLeaveTaken -= leave.days?.toInt() ?? 0;
              sickLeaveRemaining += leave.days?.toInt() ?? 0;
              break;
            case 'Maternity Leave':
              maternityLeaveTaken -= leave.days?.toInt() ?? 0;
              maternityLeaveRemaining += leave.days?.toInt() ?? 0;
              break;
            case 'Paternity Leave':
              paternityLeaveTaken -= leave.days?.toInt() ?? 0;
              paternityLeaveRemaining += leave.days?.toInt() ?? 0;
              break;
            case 'Marriage Leave':
              marriageLeaveTaken -= leave.days?.toInt() ?? 0;
              marriageLeaveRemaining += leave.days?.toInt() ?? 0;
              break;
            case 'Compassionate Leave':
              compassionateLeaveTaken -= leave.days?.toInt() ?? 0;
              compassionateLeaveRemaining += leave.days?.toInt() ?? 0;
              break;
          }
        }

        // Add unpaid authorize when all leave types are exhausted
        if ((annualLeaveRemaining <= 0 && sickLeaveRemaining <= 0 && compassionateLeaveRemaining <= 0) &&
            (leave.leaveType == 'Annual Leave' || leave.leaveType == 'Sick Leave' || leave.leaveType == 'Compassionate Leave') &&
            leave.empStatus == 'Pending' &&
            leave.supervisorStatus == 'Approved' &&
            leave.managerStatus == 'Approved') {

          // Add the leave days to unpaid authorize
          unpaidAuthorize += leave.days?.toInt() ?? 0;

          // Once unpaid authorize leave is approved, ensure no negative remaining days for other leave types
          annualLeaveRemaining = annualLeaveRemaining < 0 ? 0 : annualLeaveRemaining;
          sickLeaveRemaining = sickLeaveRemaining < 0 ? 0 : sickLeaveRemaining;
          compassionateLeaveRemaining = compassionateLeaveRemaining < 0 ? 0 : compassionateLeaveRemaining;
        }
      }
    }

    // Ensure requests are non-negative
    annualLeaveRequests = annualLeaveRequests < 0 ? 0 : annualLeaveRequests;
    sickLeaveRequests = sickLeaveRequests < 0 ? 0 : sickLeaveRequests;
    maternityLeaveRequests = maternityLeaveRequests < 0 ? 0 : maternityLeaveRequests;
    paternityLeaveRequests = paternityLeaveRequests < 0 ? 0 : paternityLeaveRequests;
    marriageLeaveRequests = marriageLeaveRequests < 0 ? 0 : marriageLeaveRequests;
    compassionateLeaveRequests = compassionateLeaveRequests < 0 ? 0 : compassionateLeaveRequests;

    return {
      'totalAnnualLeave': totalAnnualLeave,
      'totalSickLeave': totalSickLeave,
      'totalMaternityLeave': totalMaternityLeave,
      'totalPaternityLeave': totalPaternityLeave,
      'totalMarriageLeave': totalMarriageLeave,
      'totalCompassionateLeave': totalCompassionateLeave,
      'annualLeaveTaken': annualLeaveTaken,
      'sickLeaveTaken': sickLeaveTaken,
      'maternityLeaveTaken': maternityLeaveTaken,
      'paternityLeaveTaken': paternityLeaveTaken,
      'marriageLeaveTaken': marriageLeaveTaken,
      'compassionateLeaveTaken': compassionateLeaveTaken,
      'unpaidAuthorize': unpaidAuthorize,
      'annualLeaveRemaining': annualLeaveRemaining,
      'sickLeaveRemaining': sickLeaveRemaining,
      'maternityLeaveRemaining': maternityLeaveRemaining,
      'paternityLeaveRemaining': paternityLeaveRemaining,
      'marriageLeaveRemaining': marriageLeaveRemaining,
      'compassionateLeaveRemaining': compassionateLeaveRemaining,
      'annualLeaveRequests': annualLeaveRequests,
      'sickLeaveRequests': sickLeaveRequests,
      'maternityLeaveRequests': maternityLeaveRequests,
      'paternityLeaveRequests': paternityLeaveRequests,
      'marriageLeaveRequests': marriageLeaveRequests,
      'compassionateLeaveRequests': compassionateLeaveRequests,
    };
  }


  Map<String, int> leaveValues = {};

  Future<void> CalculateLeaveData() async {
    // Fetch leave data for the current employee
    await fetchLeaveData();

    // Calculate leave values using the filtered, non-null data
    leaveValues = calculateLeaveValues(allLeaveData.where((leave) => leave != null).cast<LeaveStatus>().toList());

    print('Calculated leave values: $leaveValues');

    // Trigger UI update
    setState(() {});
  }

  bool leaveTypeExists(List<LeaveStatus?> leaveList, String leaveType) {
    return leaveList.any((leave) => leave?.leaveType == leaveType);
  }


  Widget _phoneRecentLeaveTable(Size size) {
    return filteredLeaveData.isNotEmpty
        ? Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        top: size.height * 0.02,
      ),
      child: Container(
        width: size.width * 0.91,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.black26, width: 2),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: size.height * 0.04 * 3, // Adjust height for 3 rows
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                headingRowHeight: size.height * 0.042,
                dataRowHeight: size.height * 0.040,
                columnSpacing: size.width * 0.012,
                columns: [
                  DataColumn(
                      label: Text('Leave Type',
                          style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('From', style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('To', style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Days', style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Reason', style: phoneheaderTextStyle)),
                  DataColumn(
                      label:
                      Text('Approver', style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Status', style: phoneheaderTextStyle)),
                ],
                rows: filteredLeaveData.map((leave) {
                  int index = filteredLeaveData.indexOf(leave);
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(leave!.leaveType ?? '',
                            style: phonerowTextStyle),
                        onTap: () {
                          _showphoneLeaveDialog(context, index, leave);
                        },
                      ),
                      DataCell(
                        Text(
                          leave.fromDate != null
                              ? DateFormat('dd/MM/yyyy')
                              .format(leave.fromDate!.getDateTimeInUtc().toLocal())
                              : '',
                          style: phonerowTextStyle,
                        ),
                        onTap: () {
                          _showphoneLeaveDialog(context, index, leave);
                        },
                      ),
                      DataCell(
                        Text(
                          leave.toDate != null
                              ? DateFormat('dd/MM/yyyy')
                              .format(leave.toDate!.getDateTimeInUtc().toLocal())
                              : '',
                          style: phonerowTextStyle,
                        ),
                        onTap: () {
                          _showphoneLeaveDialog(context, index, leave);
                        },
                      ),
                      DataCell(
                        Text('${leave.days ?? 0} days',
                            style: phonerowTextStyle),
                        onTap: () {
                          _showphoneLeaveDialog(context, index, leave);
                        },
                      ),
                      DataCell(
                        Text(leave.reason ?? '',
                            style: phonerowTextStyle),
                        onTap: () {
                          _showphoneLeaveDialog(context, index, leave);
                        },
                      ),
                      DataCell(
                        Text(
                          leave.applyTo != null && leave.applyTo is List
                              ? (leave.applyTo as List).join(', ')
                              : leave.applyTo?.toString() ?? '',
                          style: phonerowTextStyle,
                        ),
                        onTap: () {
                          _showphoneLeaveDialog(context, index, leave);
                        },
                      ),
                      DataCell(
                        Text(
                          (leave.empStatus == 'Cancelled')
                              ? '${leave.empStatus}'
                              : (leave.managerStatus == 'Approved' ||
                              leave.managerStatus == 'Rejected')
                              ? '${leave.managerStatus}'
                              : (leave.supervisorStatus == 'Rejected')
                              ? '${leave.supervisorStatus}'
                              : '${leave.empStatus}',
                          style: phonerowTextStyle.copyWith(
                            color: (leave.empStatus == 'Cancelled')
                                ? Colors.black
                                : (leave.managerStatus == 'Approved')
                                ? Colors.green
                                : (leave.managerStatus ==
                                'Rejected' ||
                                leave.supervisorStatus ==
                                    'Rejected')
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                        onTap: () {
                          _showphoneLeaveDialog(context, index, leave);
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    )
        : SizedBox(); // Show empty widget if no data is available
  }

  Widget _phoneReviewTicketTable(Size size) {
    return filteredTicketRequests.isNotEmpty
        ? Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        top: size.height * 0.01,
      ),
      child: Container(
        width: size.width * 0.91,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black26, width: 2),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: size.height * 0.04 * 4,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                headingRowHeight: size.height * 0.042,
                dataRowHeight: size.height * 0.040,
                columnSpacing: size.width * 0.015,
                columns: [
                  DataColumn(
                      label: Text('Name', style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Badge Number',
                          style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Department',
                          style: phoneheaderTextStyle)),
                  DataColumn(
                      label:
                      Text('Position', style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Destination',
                          style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Departure Date',
                          style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Arrival Date',
                          style: phoneheaderTextStyle)),
                  DataColumn(
                      label: Text('Status', style: phoneheaderTextStyle)),
                ],
                rows: filteredTicketRequests.map((request) {
                  int index = filteredTicketRequests.indexOf(request);
                  return DataRow(cells: [
                    DataCell(Text('Rahul', style: phonerowTextStyle),
                        onTap: () {
                          _showphoneTicketDialog(context, index, request!);
                        }),
                    DataCell(Text('50598', style: phonerowTextStyle),
                        onTap: () {
                          _showphoneTicketDialog(context, index, request!);
                        }),
                    DataCell(Text('Welding', style: phonerowTextStyle),
                        onTap: () {
                          _showphoneTicketDialog(context, index, request!);
                        }),
                    DataCell(Text('Trainer', style: phonerowTextStyle),
                        onTap: () {
                          _showphoneTicketDialog(context, index, request!);
                        }),
                    DataCell(
                        Text(request?.destination ?? 'Unknown',
                            style: phonerowTextStyle), onTap: () {
                      _showphoneTicketDialog(context, index, request!);
                    }),
                    DataCell(
                        Text(
                          request?.departureDate != null
                              ? DateFormat('dd/MM/yyyy').format(
                              request!.departureDate!.getDateTimeInUtc().toLocal())
                              : 'N/A',
                          style: phonerowTextStyle,
                        ), onTap: () {
                      _showphoneTicketDialog(context, index, request!);
                    }),
                    DataCell(
                        Text(
                          request!.arrivalDate != null
                              ? DateFormat('dd/MM/yyyy').format(
                              request.arrivalDate!.getDateTimeInUtc().toLocal())
                              : 'N/A',
                          style: phonerowTextStyle,
                        ), onTap: () {
                      _showphoneTicketDialog(context, index, request!);
                    }),
                    DataCell(
                        Text(
                          (request.empStatus == 'Cancelled')
                              ? '${request.empStatus}'
                              : (request?.hrStatus == 'Approved' ||
                              request?.hrStatus == 'Rejected')
                              ? '${request.hrStatus}'
                              : '${request?.empStatus}',
                          style: phonerowTextStyle.copyWith(
                            color: (request.empStatus == 'Cancelled')
                                ? Colors.black
                                : (request.hrStatus == 'Approved')
                                ? Colors.green
                                : (request.hrStatus == 'Rejected')
                                ? Colors.red
                                : Colors.black,
                          ),
                        ), onTap: () {
                      _showphoneTicketDialog(context, index, request!);
                    }),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    )
        : Padding(
      padding: EdgeInsets.all(16.0),
    );
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
        desktop: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0), // Height of the border
              child: Container(
                color: Colors.black12, // Border color
                height: 1.0, // Height of the border
              ),
            ),
            actions: [
              Row(
                  children: [
                    SizedBox(width:size.width * 0.015,),
                    Center(
                      child: Container(
                        height:size.height * 0.140,
                        width:size.width * 0.140,
                        child: Image.asset('assets/images/awe logo.png',fit: BoxFit.contain),),),
                  ]),
              Spacer(), // Pushes the next widgets to the right
              // Icon(Icons.mail_outline_outlined),
              SizedBox(width: size.width * 0.30), // spacing between icons
              Stack(
                children: [
                  PopupMenuButton<String>(
                    color: Colors.white,
                    icon: Icon(Icons.notifications_none, size: 26, color: Colors.black),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          enabled: false,
                          child: SizedBox(
                            height: size.height * 0.200, // Limit height of the list
                            width: size.width * 0.300, // Optional: Adjust width
                            child: messageList.isEmpty
                                ? Center(
                              child: Text(
                                'No messages',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            )
                                : ListView.separated(
                              itemCount: messageList.length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                final messageData = messageList[index];
                                return ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            messageData['date'] ?? '',
                                            style: TextStyle(fontSize: 11, color: Colors.grey),
                                          ),
                                          Text(
                                            messageData['time'] ?? '',
                                            style: TextStyle(fontSize: 11, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        messageData['message'] ?? '',
                                        style: TextStyle(fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ];
                    },
                  ),
                  Positioned(
                    top: 4,
                    right: 5,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.070), // spacing between icons
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome ${employeeName.isNotEmpty? employeeName: 'N/A'}',
                    style: TextStyle(fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontStyle: FontStyle.normal), // Reduce height between lines
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontStyle: FontStyle.normal), // Same height to ensure no spacing
                  ),
                ],
              ),
              SizedBox(width:size.width * 0.030,),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
                        ? NetworkImage(image) // Valid URL
                        : null, // Fallback if image URL is empty or invalid
                    radius: 23,
                    child: image.isEmpty
                        ? Icon(Icons.person, size: 25) // Icon as a fallback
                        : null, // No child needed if there's an image
                  ),
                  Positioned(
                    top:size.height * 0.040,
                    bottom: 0,
                    right:size.width * 0.003,
                    child: GestureDetector(
                      onTap: (){
                        _showPopupMenu(context);
                      },
                      child: Container(
                        width: size.width * 0.012,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pink,
                          border: Border.all(color:white ,width: 1),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: black,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width:size.width * 0.030), // spacing between the profile and app bar end
            ],
            toolbarHeight:size.height * 0.090,
          ),
          backgroundColor: Colors.white,
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width* 0.19,),
                    Text('Hi',style: TextStyle(color: black,fontSize:24 ,fontWeight: FontWeight.bold,fontFamily: 'Inter'),),
                    SizedBox(width: size.width * 0.01,),
                    Text(employeeName.isNotEmpty ?employeeName : 'N/A',style: TextStyle(color:Colors.blue,fontFamily:'Inter',fontSize: 26,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: size.height * 0.025,),
                Row(
                  children: [
                    SizedBox(width: size.width* 0.180,),
                    employeeInfoCard(
                      context,
                      doj,
                      department,
                      empType ,
                      size.width * 0.60,
                      size.height * 0.105,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.046,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.188),
                    Text(empType.isNotEmpty ? empType : 'N/A',style: TextStyle(color: dashgrey,fontFamily: 'Inter',fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: size.height * 0.014,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.183),
                    Container(
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300,width: 1),
                          borderRadius: BorderRadius.circular(5),
                          color: white
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.205),
                              Text('Total AL/SL/UA',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.040),
                              Text('Leave Taken',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.040),
                              Text('Remaining',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.040),
                              Text('Leave Request',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.095),
                              Text('Annual Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.064),
                              shoreContainer(context,'${leaveValues['totalAnnualLeave'] ?? 0}' , 15),
                              SizedBox(width: size.width * 0.058),
                              shoreContainer(context, '${leaveValues['annualLeaveTaken'] ?? 0}',15),
                              SizedBox(width: size.width * 0.047),
                              shoreContainer(context, '${leaveValues['annualLeaveRemaining'] ?? 0}',15),
                              SizedBox(width: size.width * 0.050),
                              shoreContainer(context, '${leaveValues['annualLeaveRequests'] ?? 0}',15),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.095),
                              Text('Sick Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.076),
                              shoreContainer(context, '${leaveValues['totalSickLeave'] ?? 0}',15),
                              SizedBox(width: size.width * 0.058),
                              shoreContainer(context, '${leaveValues['sickLeaveTaken'] ?? 0}',15),
                              SizedBox(width: size.width * 0.047),
                              shoreContainer(context, '${leaveValues['sickLeaveRemaining'] ?? 0}',15),
                              SizedBox(width: size.width * 0.050),
                              shoreContainer(context, '${leaveValues['sickLeaveRequests'] ?? 0}',15),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.095),
                              Text('Unpaid Authorize',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.049),
                              shoreContainer(context,'${leaveValues['unpaidAuthorize'] ?? ''}' ,15),
                              SizedBox(width: size.width * 0.030),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Paternity Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.095),
                                Text('Paternity Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.056),
                                shoreContainer(context, '${leaveValues['totalPaternityLeave'] ?? 0}',15),
                                SizedBox(width: size.width * 0.058),
                                shoreContainer(context, '${leaveValues['paternityLeaveTaken'] ?? 0}',15),
                                SizedBox(width: size.width * 0.047),
                                shoreContainer(context, '${leaveValues['paternityLeaveRemaining'] ?? 0}',15),
                                SizedBox(width: size.width * 0.050),
                                shoreContainer(context,'${leaveValues['paternityLeaveRequests'] ?? 0}' ,15),
                              ],
                            ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Maternity Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.095),
                                Text('Maternity Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.054),
                                shoreContainer(context, '${leaveValues['totalMaternityLeave'] ?? 0}',15),
                                SizedBox(width: size.width * 0.058),
                                shoreContainer(context, '${leaveValues['maternityLeaveTaken'] ?? 0}',15),
                                SizedBox(width: size.width * 0.047),
                                shoreContainer(context, '${leaveValues['maternityLeaveRemaining'] ?? 0}',15),
                                SizedBox(width: size.width * 0.050),
                                shoreContainer(context,'${leaveValues['maternityLeaveRequests'] ?? 0}' ,15),
                              ],
                            ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Compassionate Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.095),
                                Text('Compassionate Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.028),
                                shoreContainer(context, '${leaveValues['totalCompassionateLeave'] ?? 0}',15),
                                SizedBox(width: size.width * 0.058),
                                shoreContainer(context, '${leaveValues['compassionateLeaveTaken'] ?? 0}',15),
                                SizedBox(width: size.width * 0.047),
                                shoreContainer(context, '${leaveValues['compassionateLeaveRemaining'] ?? 0}',15),
                                SizedBox(width: size.width * 0.050),
                                shoreContainer(context, '${leaveValues['compassionateLeaveRequests'] ?? 0}',15),
                              ],
                            ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Marriage Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.095),
                                Text('Marriage Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.057),
                                shoreContainer(context, '${leaveValues['totalMarriageLeave'] ?? 0}',15),
                                SizedBox(width: size.width * 0.058),
                                shoreContainer(context, '${leaveValues['marriageLeaveTaken'] ?? 0}',15),
                                SizedBox(width: size.width * 0.047),
                                shoreContainer(context, '${leaveValues['marriageLeaveRemaining'] ?? 0}',15),
                                SizedBox(width: size.width * 0.050),
                                shoreContainer(context, '${leaveValues['marriageLeaveRequests'] ?? 0}',15),
                              ],
                            ),
                          SizedBox(height: size.height * 0.008,),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.060,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.180),
                    GestureDetector(
                      onTap: () => _toggleTab(true),
                      child: Column(
                        children: [
                          Text(
                            'My Recent Leave',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (isRecentLeaveSelected)
                            Container(
                              height: 3.5,
                              width: size.width * 0.08,
                              color: Colors.yellow,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.015),
                    GestureDetector(
                      onTap: () => _toggleTab(false),
                      child: Column(
                        children: [
                          Text(
                            'Employee Review Ticket',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (!isRecentLeaveSelected)
                            Container(
                              height: 3.5,
                              width: size.width * 0.11,
                              color: Colors.yellow,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.200),
                    Container(
                      width: size.width * 0.078,
                      height: size.height * 0.034,
                      color: Colors.white,
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: from,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: size.width * 0.005, bottom: size.height * 0.006),
                            hintText: 'From',
                            hintStyle: TextStyle(fontSize: 12),
                            suffixIcon: IconButton(
                              padding: EdgeInsets.only(bottom: 0.8),
                              onPressed: () => _selectDate(context, from, isFromField: true), // Call with isFromField = true
                              icon: Icon(Icons.calendar_month, size: 15, color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 1),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.018),
                    Container(
                      width: size.width * 0.078,
                      height: size.height * 0.034,
                      color: Colors.white,
                      child: Material(
                          color: Colors.transparent,
                          child: TextField(
                            controller: to,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: size.width * 0.005, bottom: size.height * 0.006),
                              hintText: 'To',
                              hintStyle: TextStyle(fontSize: 12),
                              suffixIcon: IconButton(
                                padding: EdgeInsets.only(bottom: 0.8),
                                onPressed: () => _selectDate(context, to), // Call without isFromField
                                icon: Icon(Icons.calendar_month, size: 15, color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: grey, width: 1),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    isRecentLeaveSelected ? RecentLeaveTable(
                        filteredLeaveData: filteredLeaveData.whereType<LeaveStatus>().toList(),
                        headerTextStyle: headerTextStyle,
                        rowTextStyle: rowTextStyle,
                        onCellTap: (context, index, leave){
                          _pendingDialog(context, index, leave);
                        }) : ReviewTicketTable(
                        size: size,
                        filteredTicketRequests: filteredTicketRequests.whereType<TicketRequest>().toList(),
                        onCellTap: (context, index, request){
                          _showTicketDialog(context, index, request!);
                        }),
                  ],
                ),
                SizedBox(height: size.height * 0.032,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.45),
                    if (isRecentLeaveSelected)
                    // Show "Apply Leave" button when on the "My Recent Leave" tab
                      MaterialButton(
                        onPressed: () {
                          Get.to(() => ApplyLeaveScreen());
                        },
                        minWidth: size.width * 0.080,
                        height: size.height * 0.055,
                        color: yellow,
                        child: Text(
                          'Apply Leave',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                      ),
                    if (!isRecentLeaveSelected)
                    // Show "Request Ticket" button when on the "Employee Review Ticket" tab
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              _requestDialog(context);
                            },
                            child: Text(
                              "Request Ticket",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none, // Remove default underline
                              ),
                            ),
                          ),
                          // Add space between text and line
                          Container(
                            height: 1,
                            color: blue, // Custom underline color
                            width: size.width * 0.065, // Set the underline width as needed
                          ),
                        ],
                      ),
                  ],
                ),

                SizedBox(height: size.height * 0.022,),
              ],
            ),
          ),
        ),

        //TAB VIEW
        tablet: Scaffold(
          appBar: AppBar(
            backgroundColor:bgColor,
            flexibleSpace: Container(
              decoration: BoxDecoration(
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0), // Height of the border
              child: Container(
                color: Colors.black12, // Border color
                height: 1.0, // Height of the border
              ),
            ),
            actions: [
              Row(
                  children: [
                    SizedBox(width:size.width * 0.020,),
                    Center(
                      child: Container(
                        height:size.height * 0.165,
                        width:size.width * 0.165,
                        child: Image.asset('assets/images/awe logo.png',fit: BoxFit.contain),),),
                  ]),
              Spacer(), // Pushes the next widgets to the right
              // Icon(Icons.mail_outline_outlined),
              SizedBox(width:size.width* 0.030), // spacing between icons
              Stack(
                children: [
                  PopupMenuButton<String>(
                    color: Colors.white,
                    icon: Icon(Icons.notifications_none, size: 23, color: Colors.black),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          enabled: false,
                          child: SizedBox(
                            height:size.height * 0.170, // Limit height of the list
                            width: size.width * 0.270, // Optional: Adjust width
                            child: messageList.isEmpty
                                ? Center(
                              child: Text('No messages',style: TextStyle(fontSize: 13,color: Colors.grey),),
                            )
                                :ListView.separated(
                              itemCount: messageList.length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                final messageData = messageList[index];
                                return ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            messageData['date'] ?? '',
                                            style: TextStyle(fontSize: 9, color: Colors.grey),
                                          ),
                                          Text(
                                            messageData['time'] ?? '',
                                            style: TextStyle(fontSize: 9, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        messageData['message'] ?? '',
                                        style: TextStyle(fontSize: 10, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ];
                    },
                  ),
                  Positioned(
                    top: 4,
                    right: 5,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(width:size.width * 0.070), // spacing between icons
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome ${employeeName.isNotEmpty? employeeName : 'N/A'}',
                    style: TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontStyle: FontStyle.normal), // Reduce height between lines
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontStyle: FontStyle.normal), // Same height to ensure no spacing
                  ),
                ],
              ),
              SizedBox(width:size.width * 0.030,),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
                        ? NetworkImage(image) // Valid URL
                        : null, // Fallback if image URL is empty or invalid
                    radius: 21,
                    child: image.isEmpty
                        ? Icon(Icons.person, size: 21) // Icon as a fallback
                        : null, // No child needed if there's an image
                  ),
                  Positioned(
                    top:size.height * 0.040,
                    bottom: 0,
                    right:size.width * 0.008,
                    child: GestureDetector(
                      onTap: (){
                        _tabPopupMenu(context);
                      },
                      child: Container(
                        width: size.width * 0.014,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pink,
                          border: Border.all(color:white ,width: 1),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: black,
                          size: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width:size.width * 0.030), // spacing between the profile and app bar end
            ],
            toolbarHeight:size.height * 0.080,
          ),
          backgroundColor: Colors.white,
          body:
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width* 0.15,),
                    Text('Hi',style: TextStyle(color: black,fontSize:24 ,fontWeight: FontWeight.bold,fontFamily: 'Inter'),),
                    SizedBox(width: size.width * 0.01,),
                    Text('${employeeName.isNotEmpty ? employeeName: 'N/A'}',style: TextStyle(color: Colors.blue,fontFamily:'Inter',fontSize: 26,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: size.height * 0.025,),
                Row(
                  children: [
                    SizedBox(width: size.width* 0.13,),
                    tabemployeeInfoCard(context,  doj.isNotEmpty ? doj : 'N/A', department.isNotEmpty ? department: 'N/A', empType.isNotEmpty?empType : 'N/A',  size.width * 0.72,
                      size.height * 0.110,),
                  ],
                ),
                SizedBox(height: size.height * 0.034,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.148),
                    Text(empType.isNotEmpty?empType : 'N/A',style: TextStyle(color: dashgrey,fontFamily: 'Inter',fontSize: 18,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: size.height * 0.014,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.128),
                    Container(
                      width: size.width * 0.72,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300,width: 1),
                          borderRadius: BorderRadius.circular(7),
                          color: white
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.018,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.205),
                              Text('Total AL/SL/UA',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.040),
                              Text('Leave Taken',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.040),
                              Text('Remaining',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.040),
                              Text('Leave Request',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.095),
                              Text('Annual Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.066),
                              shoreContainer(context, '${leaveValues['totalAnnualLeaves'] ?? 0}', 13),
                              SizedBox(width: size.width * 0.063),
                              shoreContainer(context, '${leaveValues['annualLeaveTaken'] ?? 0}',13),
                              SizedBox(width: size.width * 0.062),
                              shoreContainer(context, '${leaveValues['annualLeaveRemaining'] ?? 0}',13),
                              SizedBox(width: size.width * 0.058),
                              shoreContainer(context, '${leaveValues['annualLeaveRequests'] ?? 0}',13),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.095),
                              Text('Sick Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.081),
                              shoreContainer(context, '${leaveValues['totalSickLeave'] ?? 0}',13),
                              SizedBox(width: size.width * 0.063),
                              shoreContainer(context, '${leaveValues['sickLeaveTaken'] ?? 0}',13),
                              SizedBox(width: size.width * 0.062),
                              shoreContainer(context, '${leaveValues['sickLeaveRemaining'] ?? 0}',13),
                              SizedBox(width: size.width * 0.059),
                              shoreContainer(context, '${leaveValues['sickLeaveRequests'] ?? 0}',13),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.095),
                              Text('Unpaid Authorize',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.047),
                              shoreContainer(context, '${leaveValues['unpaidAuthorize'] ?? ''}',13),
                              SizedBox(width: size.width * 0.052),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Paternity Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.095),
                                Text('Paternity Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.081),
                                shoreContainer(context, '${leaveValues['totalPaternityLeave'] ?? 0}',13),
                                SizedBox(width: size.width * 0.063),
                                shoreContainer(context, '${leaveValues['paternityLeaveTaken'] ?? 0}',13),
                                SizedBox(width: size.width * 0.062),
                                shoreContainer(context, '${leaveValues['paternityLeaveRemaining'] ?? 0}',13),
                                SizedBox(width: size.width * 0.059),
                                shoreContainer(context, '${leaveValues['paternityLeaveRequests'] ?? 0}',13),
                              ],
                            ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Maternity Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.092),
                                Text('Maternity Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.057),
                                shoreContainer(context, '${leaveValues['totalMaternityLeave'] ?? 0}',13),
                                SizedBox(width: size.width * 0.063),
                                shoreContainer(context, '${leaveValues['maternityLeaveTaken'] ?? 0}',13),
                                SizedBox(width: size.width * 0.062),
                                shoreContainer(context, '${leaveValues['maternityLeaveRemaining'] ?? 0}',13),
                                SizedBox(width: size.width * 0.059),
                                shoreContainer(context, '${leaveValues['maternityLeaveRequests'] ?? 0}',13),
                              ],
                            ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Compassionate Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.095),
                                Text('Compassionate Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.020),
                                shoreContainer(context, '${leaveValues['totalCompassionateLeave'] ?? 0}',13),
                                SizedBox(width: size.width * 0.063),
                                shoreContainer(context, '${leaveValues['compassionateLeaveTaken'] ?? 0}',13),
                                SizedBox(width: size.width * 0.062),
                                shoreContainer(context, '${leaveValues['compassionateLeaveRemaining'] ?? 0}',13),
                                SizedBox(width: size.width * 0.059),
                                shoreContainer(context, '${leaveValues['compassionateLeaveRequests'] ?? 0}',13),
                              ],
                            ),
                          SizedBox(height: size.height * 0.010,),
                          if (leaveTypeExists(filteredLeaveData, 'Marriage Leave'))
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.095),
                                Text('Marriage Leave',style: TextStyle(color: black,fontFamily: 'Inter',fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(width: size.width * 0.058),
                                shoreContainer(context, '${leaveValues['totalMarriageLeave'] ?? 0}',13),
                                SizedBox(width: size.width * 0.063),
                                shoreContainer(context, '${leaveValues['marriageLeaveTaken'] ?? 0}',13),
                                SizedBox(width: size.width * 0.062),
                                shoreContainer(context, '${leaveValues['marriageLeaveRemaining'] ?? 0}',13),
                                SizedBox(width: size.width * 0.059),
                                shoreContainer(context, '${leaveValues['marriageLeaveRequests'] ?? 0}',13),
                              ],
                            ),
                          SizedBox(height: size.height * 0.010,),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.057,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.145),
                    GestureDetector(
                      onTap: () => _toggleTab(true),
                      child: Column(
                        children: [
                          Text(
                            'My Recent Leave',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (isRecentLeaveSelected)
                            Container(
                              height: 3.5,
                              width: size.width * 0.10,
                              color: Colors.yellow,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.015),
                    GestureDetector(
                      onTap: () => _toggleTab(false),
                      child: Column(
                        children: [
                          Text(
                            'Employee Review Ticket',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (!isRecentLeaveSelected)
                            Container(
                              height: 3.5,
                              width: size.width * 0.14,
                              color: Colors.yellow,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.205),
                    Container(
                      width: size.width * 0.106,
                      height: size.height * 0.030,
                      color: Colors.white,
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: from,
                          style: TextStyle(
                            fontSize: 09, // Set a smaller font size for the picked date
                            color: Colors.black, // You can also control the color of the text
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, bottom: 6),
                            hintText: 'From',
                            hintStyle: TextStyle(fontSize: 12),
                            suffixIcon: IconButton(
                              padding: EdgeInsets.only(bottom: 0.5,left: 14),
                              onPressed: () => _selectDate(context, from,isFromField: true), // Correct the onPressed
                              icon: Icon(
                                Icons.calendar_month,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 1), // Keep border color grey
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.016),
                    Container(
                      width: size.width * 0.106,
                      height: size.height * 0.030,
                      color: Colors.white,
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: to,
                          style: TextStyle(
                            fontSize: 09, // Set a smaller font size for the picked date
                            color: Colors.black, // You can also control the color of the text
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, bottom: 6),
                            hintText: 'To',
                            hintStyle: TextStyle(fontSize: 12),
                            suffixIcon: IconButton(
                              padding:   EdgeInsets.only(bottom: 0.5,left: 14),
                              onPressed: () => _selectDate(context, to),// Correct the onPressed
                              icon: Icon(
                                Icons.calendar_month,
                                size: 14,
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 1), // Keep border color grey
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    isRecentLeaveSelected ? RecentLeaveTable(
                        filteredLeaveData: filteredLeaveData.whereType<LeaveStatus>().toList(),
                        headerTextStyle: tabheaderTextStyle,
                        rowTextStyle: tabrowTextStyle,
                        onCellTap: (context, index, leave){
                          _showtabLeaveDialog(context, index, leave);
                        }) : ReviewTicketTable(
                        size: size,
                        filteredTicketRequests: filteredTicketRequests.whereType<TicketRequest>().toList(),
                        onCellTap: (context, index, request){
                          _showtabTicketDialog(context, index, request!);
                        }),
                  ],
                ),
                SizedBox(height: size.height * 0.032,),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.46,),
                    if (isRecentLeaveSelected)
                      MaterialButton(
                        onPressed: (){
                          Get.to(()=>ApplyLeaveScreen());
                        },
                        minWidth: size.width * 0.102,
                        height: size.height * 0.056,
                        color: yellow,
                        child: Text('Apply Leave',style: TextStyle(fontFamily: 'Inter,',fontSize: 15,fontWeight: FontWeight.bold,color: black),),
                      ),
                    SizedBox(width: size.width *  0.003 ),
                    if (!isRecentLeaveSelected)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              _tabrequestDialog(context);
                            },
                            child: Text(
                              "Request Ticket",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                color: blue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none, // Remove default underline
                              ),
                            ),
                          ),
                          // Add space between text and line
                          Container(
                            height: 1,
                            color: blue, // Custom underline color
                            width: size.width * 0.065, // Set the underline width as needed
                          ),
                        ],
                      )

                  ],
                ),
                SizedBox(height: size.height * 0.026),
              ],
            ),
          ),
        ),

        //MOBILE VIEW
        mobile: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.0), // Height of the border
              child: Container(
                color: Colors.black12, // Border color
                height: 1.0, // Height of the border
              ),
            ),
            actions: [
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.03), // Responsive width
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.15, // Responsive height
                      width: MediaQuery.of(context).size.width *
                          0.3, // Responsive width
                      child: Image.asset('assets/images/awe logo.png',
                          fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.05), // Responsive spacing between icons
              Stack(
                children: [
                  PopupMenuButton<String>(
                    color: Colors.white,
                    icon: Icon(Icons.notifications_none, size: 20, color: Colors.black),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          enabled: false,
                          child: SizedBox(
                            height:size.height * 0.160, // Limit height of the list
                            width: size.width * 0.280, // Optional: Adjust width
                            child: messageList.isEmpty
                                ? Center(
                              child: Text('No messages',style: TextStyle(fontSize: 11,color: grey),),
                            )
                                :ListView.separated(
                              itemCount: messageList.length,
                              separatorBuilder: (context, index) => Divider(),
                              itemBuilder: (context, index) {
                                final messageData = messageList[index];
                                return ListTile(
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            messageData['date'] ?? '',
                                            style: TextStyle(fontSize: 8, color: Colors.grey),
                                          ),
                                          Text(
                                            messageData['time'] ?? '',
                                            style: TextStyle(fontSize: 8, color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        messageData['message'] ?? '',
                                        style: TextStyle(fontSize: 10, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ];
                    },
                  ),
                  Positioned(
                    top: 4,
                    right: 5,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.02), // Responsive spacing between icons
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome ${employeeName}',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          0.025, // Responsive font size
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.003,
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          0.022, // Responsive font size
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.02), // Responsive spacing
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      height: size.height * 0.070,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
                                ? NetworkImage(image) // Valid URL
                                : null, // Fallback if image URL is empty or invalid
                            radius: 24,
                            child: image.isEmpty
                                ? Icon(Icons.person, size: 20) // Icon as a fallback
                                : null, // No child needed if there's an image
                          ),
                          Positioned(
                            top: size.height * 0.0344,
                            bottom: 0,
                            right: size.width * 0.02,
                            child: GestureDetector(
                              onTap: () {
                                _phonePopupMenu(context);
                              },
                              child: Container(
                                width: size.width * 0.050,
                                height: size.height * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: pink, // Adjust to your defined pink
                                  border:
                                  Border.all(color: Colors.white, width: 1),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors
                                      .black, // Adjust to your defined black
                                  size: 11,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.02), // Responsive spacing
            ],
            toolbarHeight: MediaQuery.of(context).size.height *
                0.089, // Responsive toolbar height
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.10,
                  ),
                  Text(
                    'Hi',
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(
                    employeeName,
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.053,
                  ),
                  mobileInfoCard(context, doj, department, empType),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  SizedBox(width: size.width * 0.08),
                  Text(
                    empType,
                    style: TextStyle(
                        color: dashgrey,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                children: [
                  SizedBox(width: size.width * 0.0499),
                  Container(
                    width: size.width * 0.91,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: Colors.grey.shade300, width: 2),
                        borderRadius: BorderRadius.circular(8),
                        color: white),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.016,
                        ),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.250),
                            Text(
                              'Total AL/SL/UA',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Inter',
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.025),
                            Text(
                              'Leave Taken',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Inter',
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              'Remaining',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Inter',
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.035),
                            Text(
                              'Leave Request',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Inter',
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.039),
                            Text(
                              'Annual Leave',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.13),
                            mobileContainer(context, '${leaveValues['totalAnnualLeaves'] ?? 0}', 10),
                            SizedBox(width: size.width * 0.100),
                            mobileContainer(context, '${leaveValues['annualLeaveTaken'] ?? 0}', 10),
                            SizedBox(width: size.width * 0.090),
                            mobileContainer(context, '${leaveValues['annualLeaveRemaining'] ?? 0}', 10),
                            SizedBox(width: size.width * 0.090),
                            mobileContainer(context,'${leaveValues['annualLeaveRequests'] ?? 0}' , 10),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.039),
                            Text(
                              'Sick Leave',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.162),
                            mobileContainer(context, '${leaveValues['totalSickLeave'] ?? 0}', 10),
                            SizedBox(width: size.width * 0.101),
                            mobileContainer(context, '${leaveValues['sickLeaveTaken'] ?? 0}', 10),
                            SizedBox(width: size.width * 0.088),
                            mobileContainer(context, '${leaveValues['sickLeaveRemaining'] ?? 0}', 10),
                            SizedBox(width: size.width * 0.092),
                            mobileContainer(context, '${leaveValues['sickLeaveRequests'] ?? 0}', 10),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.012,
                        ),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.042),
                            Text(
                              'Unpaid Authorize',
                              style: TextStyle(
                                  color: black,
                                  fontFamily: 'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: size.width * 0.077),
                            mobileContainer(context, '${leaveValues['unpaidAuthorize'] ?? ''}', 10),
                          ],
                        ),
                        SizedBox(height: size.height * 0.012,),
                        if (leaveTypeExists(filteredLeaveData, 'Paternity Leave'))
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.040),
                              Text(
                                'Paternity Leave',
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: size.width * 0.099),
                              mobileContainer(context, '${leaveValues['totalPaternityLeave'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.11),
                              mobileContainer(context, '${leaveValues['paternityLeaveTaken'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.082),
                              mobileContainer(context,'${leaveValues['paternityLeaveRemaining'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.089),
                              mobileContainer(context, '${leaveValues['paternityLeaveRequests'] ?? 0}', 10),
                            ],
                          ),
                        SizedBox(height: size.height * 0.001,),
                        if (leaveTypeExists(filteredLeaveData, 'Maternity Leave'))
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.040),
                              Text(
                                'Maternity Leave',
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: size.width * 0.095),
                              mobileContainer(context, '${leaveValues['totalMaternityLeave'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.102),
                              mobileContainer(context, '${leaveValues['maternityLeaveTaken'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.090),
                              mobileContainer(context, '${leaveValues['maternityLeaveRemaining'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.087),
                              mobileContainer(context, '${leaveValues['maternityLeaveRequests'] ?? 0}', 10),
                            ],
                          ),
                        SizedBox(height: size.height * 0.01,),
                        if (leaveTypeExists(filteredLeaveData, 'Compassionate Leave'))
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.040),
                              Text(
                                'Compassionate Leave',
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: size.width * 0.022),
                              mobileContainer(context, '${leaveValues['totalCompassionateLeave'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.11),
                              mobileContainer(context, '${leaveValues['compassionateLeaveTaken'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.082),
                              mobileContainer(context, '${leaveValues['compassionateLeaveRemaining'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.09),
                              mobileContainer(context, '${leaveValues['compassionateLeaveRequests'] ?? 0}', 10),
                            ],
                          ),
                        SizedBox(height: size.height * 0.014,),
                        if (leaveTypeExists(filteredLeaveData, 'Marriage Leave'))
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.040),
                              Text(
                                'Marriage Leave',
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: size.width * 0.099),
                              mobileContainer(context, '${leaveValues['totalMarriageLeave'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.112),
                              mobileContainer(context, '${leaveValues['marriageLeaveTaken'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.083),
                              mobileContainer(context, '${leaveValues['marriageLeaveRemaining'] ?? 0}', 10),
                              SizedBox(width: size.width * 0.090),
                              mobileContainer(context, '${leaveValues['marriageLeaveRequests'] ?? 0}', 10),
                            ],
                          ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.052),
                      GestureDetector(
                        onTap: () => _toggleTab(true),
                        child: Column(
                          children: [
                            Text(
                              'My Recent Leave',
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Inter',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (isRecentLeaveSelected)
                              Container(
                                height: 3.5,
                                width: size.width * 0.25,
                                color: Colors.yellow,
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * 0.019),
                      GestureDetector(
                        onTap: () => _toggleTab(false),
                        child: Column(
                          children: [
                            Text(
                              'Employee Review Ticket',
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Inter',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            if (!isRecentLeaveSelected)
                              Container(
                                height: 3.5,
                                width: size.width * 0.35,
                                color: Colors.yellow,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: size.height *
                          0.01), // Add space between tabs and TextFields
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.5),
                      // "From" TextField
                      Container(
                        width: size.width * 0.233,
                        height: size.height * 0.028,
                        color: Colors.white,
                        child: Material(
                          color: Colors.transparent,
                          child: TextField(
                            controller: from,
                            style: TextStyle(fontSize: 8, color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.only(left: 5, bottom: 6),
                              hintText: 'From',
                              hintStyle: TextStyle(fontSize: 9),
                              suffixIcon: IconButton(
                                padding:
                                EdgeInsets.only(bottom: 0.05, left: 18),
                                onPressed: () => _selectDate(context, from,
                                    isFromField: true),
                                icon: Icon(Icons.calendar_month,
                                    size: 11, color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: grey, width: 1),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.018,),
                      Container(
                        width: size.width * 0.233,
                        height: size.height * 0.028,
                        color: Colors.white,
                        child: Material(
                          color: Colors.transparent,
                          child: TextField(
                            controller: to,
                            style: TextStyle(fontSize: 8, color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.only(left: 5, bottom: 6),
                              hintText: 'To',
                              hintStyle: TextStyle(fontSize: 9),
                              suffixIcon: IconButton(
                                padding:
                                EdgeInsets.only(bottom: 0.05, left: 18),
                                onPressed: () => _selectDate(context, to),
                                icon: Icon(Icons.calendar_month,
                                    size: 11, color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: grey, width: 1),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: size.height * 0.02), // Space before the table
                  // The table view
                  Row(
                    children: [
                      isRecentLeaveSelected
                          ? _phoneRecentLeaveTable(size)
                          : _phoneReviewTicketTable(size),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.020),
              Row(
                children: [
                  SizedBox(width: size.width * 0.35),
                  if (isRecentLeaveSelected) // Show "Apply Leave" button for recent leave
                    MaterialButton(
                      onPressed: () {
                        Get.to(() => ApplyLeaveScreen());
                      },
                      minWidth: size.width * 0.040,
                      height: size.height * 0.038,
                      color: yellow,
                      child: Text(
                        'Apply Leave',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ),
                  if (!isRecentLeaveSelected) // Show "Request Ticket" button for employee review
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            _phonerequestDialog(context);
                          },
                          child: Text(
                            "Request Ticket",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              color: blue,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration
                                  .none, // Remove default underline
                            ),
                          ),
                        ),
                        // Add space between text and line
                        Container(
                          height: 1,
                          color: blue, // Custom underline color
                          width: size.width *
                              0.065, // Set the underline width as needed
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
        paddingWidth: size.width * 0.1,
        bgColor: bgColor);
  }


}


Widget newContainer(BuildContext context, TextEditingController controller,String text, double no,{bool readOnly = false}){
  final Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.24,
    height: size.height * 0.038, // Increase the height for better alignment
    child: Material(
      color: Colors.transparent,
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        style: TextStyle(fontSize: 13), // Adjust font size if necessary
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontSize: no),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: grey, width: 1),
            borderRadius: BorderRadius.circular(0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.010, horizontal: size.width * 0.007), // Adjust vertical padding
        ),
      ),
    ),
  );

}

Widget myContainer(BuildContext context, TextEditingController controller,){
  final Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.10,
    height: size.height * 0.038,
    child: Material(
      color: Colors.transparent,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: grey,width: 1),
            borderRadius: BorderRadius.circular(0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.010, horizontal: size.width * 0.007),
        ),

      ),
    ),
  );
}

Widget employeeInfoCard(BuildContext context, String joiningDate, String department, String location, double width, double height) {
  final Size size = MediaQuery.of(context).size;

  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.grey.shade300, width: 1),
      color: Colors.white, // Custom color
    ),
    child: Column(
      children: [
        SizedBox(height: size.height * 0.015),

        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Date of Joining',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Department',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Location',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: size.height * 0.010),

        // Data Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  joiningDate,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  department,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  location,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        Spacer(), // Pushes the line to the bottom

        Divider(
          color: Colors.yellow, // Yellow line color
          thickness: 3, // Thickness of the yellow line
          height: 0, // No spacing above or below the line
        ),
      ],
    ),
  );
}


Widget shoreContainer(BuildContext context, String text,double font){
  final Size size = MediaQuery.of(context).size;
  return  Container(
    width: size.width * 0.042,
    height: size.height * 0.035,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300,width: 1),
      color: Colors.white,
    ),
    child: Align(
        alignment: Alignment.center,
        child: Text(text,style: TextStyle(fontFamily: 'Inter',fontSize: font,color: black,fontWeight: FontWeight.bold),)),
  );
}

Widget tabemployeeInfoCard(BuildContext context, String joiningDate,  String department, String location,double width, double height) {
  final Size size = MediaQuery.of(context).size;
  return
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey.shade300,width: 1),
          color: white
      ), // Custom color
      child: Column(
        children: [
          SizedBox(height: size.height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Date of joining',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Department',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Location',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.010),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    joiningDate,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    department,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    location,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(), // Pushes the line to the bottom
          Divider(
            color: Colors.yellow, // Yellow line color
            thickness: 3, // Thickness of the yellow line
            height: 0, // No spacing above or below the line
          ),
        ],
      ),
    );
}


Widget mobileInfoCard(BuildContext context, String joinindate,
    String department, String location) {
  final Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.9,
    height: size.height * 0.09,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300, width: 2),
        color: Colors.white),
    child: Column(
      children: [
        SizedBox(height: size.height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Date of joining',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Department',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Location',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.010),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  joinindate,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  department,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  location,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(), // Pushes the line to the bottom
        Divider(
          color: Colors.yellow, // Yellow line color
          thickness: 3, // Thickness of the yellow line
          height: 0, // No spacing above or below the line
        ),
      ],
    ),
  );
}

final TextEditingController userIdController = TextEditingController();

Widget mobileContainer(BuildContext context, String text, double font) {
  final Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.062,
    height: size.height * 0.025,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300, width: 1),
      color: Colors.white,
    ),
    child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: font,
              color: black,
              fontWeight: FontWeight.bold),
        )),
  );
}

Widget phonePopContainer(BuildContext context, TextEditingController controller,
    String text, double no,
    {bool readonly = false}) {
  final Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.59,
    height: size.height * 0.037, // Increase the height for better alignment
    child: Material(
      color: Colors.transparent,
      child: TextField(
        controller: controller,
        readOnly: readonly,
        style: TextStyle(fontSize: 14), // Adjust font size if necessary
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontSize: no),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.014,
              horizontal: size.width * 0.02), // Adjust vertical padding
        ),
      ),
    ),
  );
}

TextStyle headerTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Colors.black,
);

TextStyle rowTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontSize: 13,
  color: Colors.black,
);

TextStyle tabheaderTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  fontSize: 13,
  color: Colors.black,
);

TextStyle tabrowTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontSize: 12,
  color: Colors.black,
);

TextStyle phoneheaderTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.bold,
  fontSize: 8.5,
  color: Colors.black,
);

TextStyle phonerowTextStyle = TextStyle(
  fontFamily: 'Inter',
  fontSize: 8,
  color: Colors.black,
);
