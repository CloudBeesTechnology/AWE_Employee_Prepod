import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:awe_project/Components/helper_class.dart';
import 'package:awe_project/Screens/login_screen.dart';
import 'package:awe_project/globals/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_screen.dart';
class changePasswordScreen extends StatefulWidget {
  final String username;
  const changePasswordScreen({super.key, required this.username});

  @override
  State<changePasswordScreen> createState() => _SignupScreenState();
}



class _SignupScreenState extends State<changePasswordScreen> {
  TextEditingController userIdController=TextEditingController();
  TextEditingController  pasword=TextEditingController();
  TextEditingController  newPassword=TextEditingController();
  TextEditingController  confirmPassword=TextEditingController();

  bool _isLoading=false;

  // Toggle the visibility of the password
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _changePassword(BuildContext context) async {
    if (newPassword.text.trim() == confirmPassword.text.trim()) {
      try {
        // Change the password using Amplify Auth's updatePassword method
        await Amplify.Auth.updatePassword(
          newPassword: newPassword.text.trim(),
          oldPassword: pasword.text.trim(), // Existing password
        );

        // Show a success dialog
        _showSuccessDialog('Password updated successfully.');

        // Navigate back to the login screen after showing the success dialog
        await Future.delayed(Duration(seconds: 3)); // Optional: delay to allow user to see the success message
        Get.off(() => LoginScreen());
      } on AuthException catch (e) {
        // Show an error if the update fails
        _showErrorDialog(e.message);
      }
    } else {
      _showErrorDialog('Passwords do not match.');
    }
  }

// Function to show success dialog
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Success"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text("Okay"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

// Function to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Signup Failed"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text("Okay"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }


  bool _obscureText = true;
  bool _obscure = true;
  bool isloading = false;
  Future<void> _handleUpdateButton() async {
    setState(() {
      isloading = true; // Show the spinner
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isloading = false; // Hide the spinner
    });
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
        desktop: Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/lock.png', // Replace with your image URL or asset path
                  width:size.width * 0.400,
                  height: size.height * 0.500,
                ),
              ),
              SizedBox(height:size.height * 0.030), // Space between image and form
              Expanded(
                flex: 1,
                child: Padding(
                  padding:  EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding:  EdgeInsets.all(1),
                        height: size.height * 0.105,
                        width:size.width * 0.300,
                        child: Image(image: AssetImage(
                            'assets/images/awe logo.png'),
                          fit: BoxFit.contain,
                        ),),
                      Center(
                        child: Container(
                          height:size.height * 0.050,
                          child:  Text(
                            'Change Password',
                            style: TextStyle(fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.right,
                          ),),),
                       SizedBox(height:size.height * 0.010),
                      SizedBox(
                        width:size.width * 0.230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('User ID', style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),),
                            SizedBox(height:size.height * 0.005),
                           userId(context, userIdController, 0.048, 0.210),
                          ],
                        ),
                      ),
                       SizedBox(height:size.height * 0.015),
                      SizedBox(
                        width:size.width * 0.230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Current Password', style: TextStyle(
                                fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,
                                color: Colors.black, fontStyle: FontStyle.normal),
                            ),
                            SizedBox(height:size.height * 0.005),
                           userId(context, pasword, 0.048, 0.210),
                          ],
                        ),
                      ),
                       SizedBox(height:size.height * 0.015),
                      SizedBox(
                        width:size.width * 0.230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('New Password', style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontStyle: FontStyle.normal)),
                            SizedBox(height:size.height * 0.005),
                            userId(context, newPassword, 0.048, 0.210)
                          ],
                        ),
                      ),
                       SizedBox(height:size.height * 0.015),
                      SizedBox(
                        width:size.width * 0.230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Confirm Password', style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontStyle: FontStyle.normal),),
                            SizedBox(height:size.height * 0.005),
                           userId(context, confirmPassword, 0.048, 0.210)
                          ],
                        ),
                      ),
                       SizedBox(height:size.height * 0.030),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: size.width * 0.145,),
                          OutlinedButton(
                            onPressed: () {
                              Get.off(DashBoardScreeen());
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(size.width * 0.075, size.height * 0.055), // Similar to minWidth and height in MaterialButton
                              side: BorderSide(color: grey), // Define the border color for the outlined button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0), // Adjust the border radius as needed
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: black,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.02,),
                          MaterialButton(
                            onPressed: _isLoading
                                ? null // Disable the button while loading
                                : () async {
                              setState(() {
                                _isLoading = true; // Start loading
                              });
                              await _changePassword(context);
                              setState(() {
                                _isLoading = false; // Stop loading
                              });
                            },
                            minWidth: size.width * 0.078,
                            height: size.height * 0.055,
                            color: yellow,
                            splashColor: yellow,
                            child: _isLoading
                                ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(yellow), // Set spinner color to yellow
                            )
                                : Text(
                              "Update",
                              style: TextStyle(
                                color: black,
                                fontFamily: 'Open Sans',
                                fontSize: 16,fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.050, width:size.width * 0.280,
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1.0,
                        ),)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        tablet: Scaffold(
          backgroundColor: Colors.white,
            body:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/lock.png', // Replace with your image URL or asset path
                    width:size.width * 0.350,
                    height: size.height * 0.450,
                  ),
                ),
                SizedBox(height: size.height *0.030), // Space between image and form
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:  EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:  EdgeInsets.all(1),
                          height:size.height * 0.090,
                          width:size.width * 0.2700,
                          child: Image(image: AssetImage(
                              'assets/images/awe logo.png'),
                            fit: BoxFit.contain,
                          ),),
                        Center(
                          child: Container(
                            height:size.height * 0.050,
                            child: const Text(
                              'Change Password',
                              style: TextStyle(fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.right,
                            ),),),
                         SizedBox(height:size.height * 0.015),
                        SizedBox(
                          width:size.width * 0.350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('User ID', style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal),),
                            userId(context, userIdController, 0.050, 0.315),
                            ],
                          ),
                        ),
                         SizedBox(height:size.height * 0.010),
                        SizedBox(
                          width:size.width * 0.350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Current Password', style: TextStyle(
                                  fontSize: 15, fontFamily: 'Inter', fontWeight: FontWeight.w600,
                                  color: Colors.black, fontStyle: FontStyle.normal),
                              ),
                              SizedBox(height:size.height * 0.005),
                            userId(context, pasword, 0.050, 0.315)
                            ],
                          ),
                        ),
                         SizedBox(height:size.height * 0.010),
                        SizedBox(
                          width:size.width * 0.350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('New Password', style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal)),
                              SizedBox(height:size.height * 0.005),
                             userId(context, newPassword, 0.050, 0.315)
                            ],
                          ),
                        ),
                         SizedBox(height:size.height *0.010),
                        SizedBox(
                          width:size.width * 0.350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Confirm Password', style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal),),
                              SizedBox(height:size.height * 0.005),
                              userId(context, newPassword, 0.050, 0.315)
                            ],
                          ),
                        ),
                         SizedBox(height:size.height * 0.035),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.120,),
                            OutlinedButton(
                              onPressed: () {
                                Get.off(DashBoardScreeen());
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(size.width * 0.075, size.height * 0.055), // Similar to minWidth and height in MaterialButton
                                side: BorderSide(color: grey), // Define the border color for the outlined button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0), // Adjust the border radius as needed
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.02,),
                            MaterialButton(
                              onPressed: _isLoading
                                  ? null // Disable the button while loading
                                  : () async {
                                setState(() {
                                  _isLoading = true; // Start loading
                                });
                                await _changePassword(context);
                                setState(() {
                                  _isLoading = false; // Stop loading
                                });
                              },
                              minWidth: size.width * 0.105,
                              height: size.height * 0.055,
                              color: yellow,
                              splashColor: yellow,
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(yellow), // Set spinner color to yellow
                              )
                                  : Text(
                                "Update",
                                style: TextStyle(
                                    color: black,
                                    fontFamily: 'Open Sans',
                                    fontSize: 16,fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:size.height * 0.055, width:size.width * 0.300,
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1.0,
                          ),)
                      ],
                    ),
                  ),
                ),

              ],
            ),
        ),
    mobile: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.520,
                    height: size.height * 0.15,
                    child: Image.asset(
                      'assets/images/awe logo.png',
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/lock.png'),
                    height: size.height * 0.200,
                    width: size.width * 0.400,
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: size.height * 0.019),
                  SizedBox(
                    width: size.width * 0.600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'User ID',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontStyle: FontStyle.normal),
                        ),
                        SizedBox(height:size.height * 0.005),
                        userId(context, userIdController, 0.042, 0.78)
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  SizedBox(
                    width: size.width * 0.600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Current Password',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontStyle: FontStyle.normal),
                        ),
                        SizedBox(height:size.height * 0.005),
                        userId(context, pasword, 0.042, 0.78)
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  SizedBox(
                    width: size.width * 0.600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('New Password',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontStyle: FontStyle.normal)),
                        SizedBox(height:size.height * 0.005),
                        userId(context, newPassword, 0.042, 0.78)
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  SizedBox(
                    width: size.width * 0.600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontStyle: FontStyle.normal),
                        ),
                        SizedBox(height:size.height * 0.005),
                        userId(context, confirmPassword, 0.042, 0.78)
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.046),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.273,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Get.off(DashBoardScreeen());
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(
                              size.width * 0.070,
                              size.height *
                                  0.050), // Similar to minWidth and height in MaterialButton
                          side: BorderSide(
                              color:
                              grey), // Define the border color for the outlined button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                0), // Adjust the border radius as needed
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      MaterialButton(
                        onPressed: _isLoading
                            ? null // Disable the button while loading
                            : () async {
                          setState(() {
                            _isLoading = true; // Start loading
                          });
                          await _changePassword(context);
                          setState(() {
                            _isLoading = false; // Stop loading
                          });
                        },
                        minWidth: size.width * 0.2,
                        height: size.height * 0.050,
                        color: yellow,
                        splashColor: yellow,
                        child: _isLoading
                            ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              yellow), // Set spinner color to yellow
                        )
                            : Text(
                          "Update",
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Open Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.050,
                    width: size.width * 0.600,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  )
                ])
          ]),
        )
    ),
        paddingWidth: size.width * 0.1,

        bgColor: bgColor);
  }
}


class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final bool obscureText;
  const MyTextField({super.key, required this.controller, required this.text, required this.icon, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return   Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: Container(
        width: size.width *  0.235,
        height: size.height * 0.050,
        child: Material(
          color: Colors.white,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),  // Align the text vertically with the icon
              prefixIcon: Icon(
                icon,
                color: Colors.grey,
                size: 21,  // Adjust icon size if needed
              ),
              hintText: text,

              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget customTextFieldContainer(
    BuildContext context,
    TextEditingController controller, {
      double widthFactor = 0.3,
      double heightFactor = 0.05,
      String hintText = '',
    }) {
  final Size size = MediaQuery.of(context).size;

  return Container(
    width: size.width * widthFactor,
    height: size.height * heightFactor,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey.shade400, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Widget userId(BuildContext context, TextEditingController controller, double height, double width) {
  final Size size = MediaQuery.of(context).size;

  return Container(
    width: size.width * width,
    height: size.height * height,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none, // Remove default border
        isDense: true, // Reduce the overall height of the TextField
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Adjust padding
        hintStyle: TextStyle(color: Colors.grey.shade500),
      ),
      style: TextStyle(height: 1.4), // Adjust text height
    ),
  );
}

