import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:awe_project/Components/helper_class.dart';
import 'package:awe_project/globals/my_colors.dart';
import 'package:aws_ses_api/email-2010-12-01.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Components/my_textfield.dart';
import '../globals/datefield.dart';
import '../models/EmailNotifi.dart';
import '../models/EmpLeaveDetails.dart';
import '../models/LeaveStatus.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';
class ApplyLeaveScreen extends StatefulWidget {
  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  TextEditingController leave=TextEditingController();
  TextEditingController from=TextEditingController();
  TextEditingController to=TextEditingController();
  TextEditingController reason=TextEditingController();
  TextEditingController  days=TextEditingController();

  final box = GetStorage();
  String gender='' ;
  String employeeName ='';
  String position='';
  String badgeno='' ;
  String image='' ;
  String  department='';
   String  supervisorName='';
   String  managerName='';
  String  managerEmail='';
  String supervisorEmail ='';

  String annualLeave = '';
  String sickLeave = '';
  String compasLeave = '';
  String mrageLeave = '';
  String paterLeave = '';
  String materLeave = '';






  List<String> _leaveTypes = [];

  final List<String> _allLeaveTypes = [
    'Annual Leave',
    'Sick Leave',
    'Hospitalisation Leave',
    'Compassionate Leave',
    'Marriage Leave',
    'Compensate Leave',
    'Maternity Leave',
    'Paternity Leave',
  ];

  String? _selectedLeaveType;
  DateTime? selectedDate;
  bool isSelected=false;
  DateTime? _fromDate;
  DateTime? _toDate;
  bool isHalfDay=false;
  bool isManager=false;
  bool isSupervisor=false;
  String? selectedTicket;

  String? leaveTypeError;
  String? fromDateError;
  String? toDateError;
  String? applyToError;
  String? ticketError;
  String? reasonError;
  String? certificateError;


  @override
  void initState() {
    super.initState();

    final box = GetStorage();
    employeeName = box.read('name') ?? 'N/A';
    badgeno = box.read('badgeNo') ?? 'N/A';
    position = box.read('position') ?? 'N/A';
    image = box.read('image') ?? 'N/A';
    department = box.read('department') ?? 'N/A';
    managerEmail = box.read('managerEmail') ?? 'N/A';
    supervisorEmail = box.read('supervisorEmail') ?? 'N/A';
      supervisorName =box.read('supervisorName') ?? 'N/A';
     managerName=box.read('managerName') ?? 'N/A';
    gender = (box.read('gender') ?? 'N/A').toLowerCase(); // Normalize gender to lowercase
    print('Gender fetched from GetStorage: $gender'); // Verify gender value

    initializeData();

    // Filter leave types based on gender
    setState(() {
      _leaveTypes = _allLeaveTypes.where((leave) {
        if (gender == 'male') {
          // For male, remove 'Maternity Leave'
          if (leave == 'Maternity Leave') {
            return false; // Exclude 'Maternity Leave' for male
          }
        } else if (gender == 'female') {
          // For female, remove 'Paternity Leave'
          if (leave == 'Paternity Leave') {
            return false; // Exclude 'Paternity Leave' for female
          }
        }
        return true; // For all other cases, include the leave type
      }).toList();

      // Debugging: Show the filtered leave types
      print('Filtered Leave Types: $_leaveTypes');
    });
  }

  Future<void> initializeData() async {
    // Wait for all data-fetching functions to complete
    await Future.wait([
      fetchLeaveData(),
      fetchLeaveDetails(context),

    ]);
    if (mounted) {
      CalculateLeaveData();
    }
  }

  List<LeaveStatus?> allLeaveData = []; // Your leave data
  List<LeaveStatus?> filteredLeaveData = [];

  Future<void> fetchLeaveData() async {
    try {
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
        // _showAlertDialog('Error', 'Failed to fetch leave data.');

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

      });

      if (allLeaveData.isEmpty) {
        print('No leave data found for the user.');
      }
    } catch (e) {

      print('Failed to fetch leave data: $e');
      // _showAlertDialog('Error', 'An unexpected error occurred.');
    }
  }

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

  Map<String, int> calculateLeaveValues(List<LeaveStatus> leaveList) {
    int currentYear = DateTime.now().year;

    // Define the necessary variables
    int lastCalculatedYear = currentYear;  // Initialize the lastCalculatedYear
    int totalAnnualLeave = int.tryParse(annualLeave) ?? 0;
    int totalSickLeave = int.tryParse(sickLeave) ?? 0;
    int totalHospitalisationLeave = 60;
    int totalMaternityLeave = int.tryParse(materLeave) ?? 0;
    int totalPaternityLeave = int.tryParse(paterLeave) ?? 0;
    int totalMarriageLeave = int.tryParse(mrageLeave) ?? 0;
    int totalCompassionateLeave = int.tryParse(compasLeave) ?? 0;
    int unpaidAuthorize = 0;  // Initialize unpaidAuthorize

    // Check if the leave data needs to be reset for a new year
    if (lastCalculatedYear != currentYear) {
      // Reset total leaves to the default values for a new year
      totalAnnualLeave = int.tryParse(annualLeave) ?? 0;
      totalSickLeave = int.tryParse(sickLeave) ?? 0;
      totalHospitalisationLeave = 60;
      totalMaternityLeave = int.tryParse(materLeave) ?? 0;
      totalPaternityLeave = int.tryParse(paterLeave) ?? 0;
      totalMarriageLeave = int.tryParse(mrageLeave) ?? 0;
      totalCompassionateLeave = int.tryParse(compasLeave) ?? 0;
      unpaidAuthorize = 0;
      // Update the last calculated year
      lastCalculatedYear = currentYear;
    }


    int annualLeaveTaken = 0;
    int sickLeaveTaken = 0;
    int hospitalisationLeaveTaken = 0;
    int maternityLeaveTaken = 0;
    int paternityLeaveTaken = 0;
    int marriageLeaveTaken = 0;
    int compassionateLeaveTaken = 0;

    int annualLeaveRequests = 0;
    int sickLeaveRequests = 0;
    int hospitalisationLeaveRequests = 0;
    int maternityLeaveRequests = 0;
    int paternityLeaveRequests = 0;
    int marriageLeaveRequests = 0;
    int compassionateLeaveRequests = 0;

    int annualLeaveRemaining = totalAnnualLeave;
    int sickLeaveRemaining = totalSickLeave;
    int hospitalisationLeaveRemaining = totalHospitalisationLeave;
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
              sickLeaveRequests++;
              break;
            case 'Hospitalisation Leave':
              hospitalisationLeaveRequests++;
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
              sickLeaveRequests--;
              break;
            case 'Hospitalisation Leave':
              hospitalisationLeaveRequests--;
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
              sickLeaveRequests--;
              break;
            case 'Hospitalisation Leave':
              hospitalisationLeaveRequests --;
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
              sickLeaveRequests--;
              break;
            case 'Hospitalisation Leave':
              hospitalisationLeaveRequests--;
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
          int approvedDays = leave.days?.toInt() ?? 0;

          switch (effectiveLeaveType) {
            case 'Marriage Leave':
              if (approvedDays > marriageLeaveRemaining) {
                int excessDays = approvedDays - marriageLeaveRemaining;
                marriageLeaveTaken += marriageLeaveRemaining;
                marriageLeaveRemaining = 0;

                if (annualLeaveRemaining >= excessDays) {
                  annualLeaveTaken += excessDays;
                  annualLeaveRemaining -= excessDays;
                } else {
                  int leftover = excessDays - annualLeaveRemaining;
                  annualLeaveTaken += annualLeaveRemaining;
                  annualLeaveRemaining = 0;

                  sickLeaveTaken += leftover;
                  sickLeaveRemaining -= leftover;
                }
              } else {
                marriageLeaveTaken += approvedDays;
                marriageLeaveRemaining -= approvedDays;
              }
              break;

            case 'Paternity Leave':
              if (approvedDays > paternityLeaveRemaining) {
                int excessDays = approvedDays - paternityLeaveRemaining;
                paternityLeaveTaken += paternityLeaveRemaining;
                paternityLeaveRemaining = 0;

                if (annualLeaveRemaining >= excessDays) {
                  annualLeaveTaken += excessDays;
                  annualLeaveRemaining -= excessDays;
                } else {
                  int leftover = excessDays - annualLeaveRemaining;
                  annualLeaveTaken += annualLeaveRemaining;
                  annualLeaveRemaining = 0;

                  sickLeaveTaken += leftover;
                  sickLeaveRemaining -= leftover;
                }
              } else {
                paternityLeaveTaken += approvedDays;
                paternityLeaveRemaining -= approvedDays;
              }
              break;

            case 'Annual Leave':
              annualLeaveTaken += approvedDays;
              annualLeaveRemaining -= approvedDays;
              break;

            case 'Sick Leave':
              sickLeaveTaken += approvedDays;
              sickLeaveRemaining -= approvedDays;
              break;

            case 'Hospitalisation Leave':
              hospitalisationLeaveTaken += approvedDays;
              hospitalisationLeaveRemaining -= approvedDays;
              break;

            case 'Maternity Leave':
              maternityLeaveTaken += approvedDays;
              maternityLeaveRemaining -= approvedDays;
              break;

            case 'Compassionate Leave':
              compassionateLeaveTaken += approvedDays;
              compassionateLeaveRemaining -= approvedDays;
              break;
          }
        }

        // Handling cancelled leave requests
        if (leave.empStatus == 'Cancelled' && leave.managerStatus == 'Approved') {
          int canceledDays = leave.days?.toInt() ?? 0;

          switch (effectiveLeaveType) {
            case 'Marriage Leave':
              marriageLeaveTaken -= canceledDays;
              marriageLeaveRemaining += canceledDays;
              break;
            case 'Paternity Leave':
              paternityLeaveTaken -= canceledDays;
              paternityLeaveRemaining += canceledDays;
              break;
            case 'Annual Leave':
              annualLeaveTaken -= canceledDays;
              annualLeaveRemaining += canceledDays;
              break;
            case 'Sick Leave':
              sickLeaveTaken -= canceledDays;
              sickLeaveRemaining += canceledDays;
              break;
            case 'Hospitalisation Leave':
              hospitalisationLeaveTaken -= canceledDays;
              hospitalisationLeaveRemaining += canceledDays;
              break;
            case 'Maternity Leave':
              maternityLeaveTaken -= canceledDays;
              maternityLeaveRemaining += canceledDays;
              break;
            case 'Compassionate Leave':
              compassionateLeaveTaken -= canceledDays;
              compassionateLeaveRemaining += canceledDays;
              break;
          }
        }

        // Add unpaid authorize when all leave types are exhausted
        if (annualLeaveRemaining <= 0 && sickLeaveRemaining <= 0) {
          // Condition 1: Annual or Sick Leave
          if ((leave.leaveType == 'Annual Leave' || leave.leaveType == 'Sick Leave') &&
              leave.empStatus == 'Pending' &&
              leave.supervisorStatus == 'Approved' &&
              leave.managerStatus == 'Approved') {
            unpaidAuthorize += leave.days?.toInt() ?? 0;
          }
          // Condition 2: Compassionate, Marriage, or Paternity Leave
          if ((leave.leaveType == 'Compassionate Leave' && compassionateLeaveRemaining <= 0) ||
              (leave.leaveType == 'Marriage Leave' && marriageLeaveRemaining <= 0) ||
              (leave.leaveType == 'Paternity Leave' && paternityLeaveRemaining <= 0)) {
            print('Leave Type: ${leave.leaveType}, Compassionate Leave Remaining: $compassionateLeaveRemaining');
            if (leave.empStatus == 'Pending' &&
                leave.supervisorStatus == 'Approved' &&
                leave.managerStatus == 'Approved') {
              print('Adding extra days to Unpaid Leave: ${leave.days}');
              unpaidAuthorize += leave.days?.toInt() ?? 0;
            } else {
              print('Leave not approved or in pending status');
            }
          }

        }

      }
    }

    // Ensure no negative remaining days for any leave type
    annualLeaveRemaining = annualLeaveRemaining < 0 ? 0 : annualLeaveRemaining;
    sickLeaveRemaining = sickLeaveRemaining < 0 ? 0 : sickLeaveRemaining;
    compassionateLeaveRemaining = compassionateLeaveRemaining < 0 ? 0 : compassionateLeaveRemaining;
    marriageLeaveRemaining = marriageLeaveRemaining < 0 ? 0 : marriageLeaveRemaining;
    paternityLeaveRemaining = paternityLeaveRemaining < 0 ? 0: paternityLeaveRemaining;
    hospitalisationLeaveRemaining =hospitalisationLeaveRemaining < 0 ? 0: hospitalisationLeaveRemaining;
    maternityLeaveRemaining = maternityLeaveRemaining < 0 ? 0: maternityLeaveRemaining;

    // Ensure requests are non-negative
    annualLeaveRequests = annualLeaveRequests < 0 ? 0 : annualLeaveRequests;
    sickLeaveRequests = sickLeaveRequests < 0 ? 0 : sickLeaveRequests;
    hospitalisationLeaveRequests = hospitalisationLeaveRequests < 0 ? 0 : hospitalisationLeaveRequests;
    maternityLeaveRequests = maternityLeaveRequests < 0 ? 0 : maternityLeaveRequests;
    paternityLeaveRequests = paternityLeaveRequests < 0 ? 0 : paternityLeaveRequests;
    marriageLeaveRequests = marriageLeaveRequests < 0 ? 0 : marriageLeaveRequests;
    compassionateLeaveRequests = compassionateLeaveRequests < 0 ? 0 : compassionateLeaveRequests;

    return {
      'totalAnnualLeave': totalAnnualLeave,
      'totalSickLeave': totalSickLeave,
      'totalHospitalisationLeave':totalHospitalisationLeave,
      'totalMaternityLeave': totalMaternityLeave,
      'totalPaternityLeave': totalPaternityLeave,
      'totalMarriageLeave': totalMarriageLeave,
      'totalCompassionateLeave': totalCompassionateLeave,
      'annualLeaveTaken': annualLeaveTaken,
      'sickLeaveTaken': sickLeaveTaken,
      'hospitalisationLeaveTaken':hospitalisationLeaveTaken,
      'maternityLeaveTaken': maternityLeaveTaken,
      'paternityLeaveTaken': paternityLeaveTaken,
      'marriageLeaveTaken': marriageLeaveTaken,
      'compassionateLeaveTaken': compassionateLeaveTaken,
      'unpaidAuthorize': unpaidAuthorize,
      'annualLeaveRemaining': annualLeaveRemaining,
      'sickLeaveRemaining': sickLeaveRemaining,
      'hospitalisationLeaveRemaining':hospitalisationLeaveRemaining,
      'maternityLeaveRemaining': maternityLeaveRemaining,
      'paternityLeaveRemaining': paternityLeaveRemaining,
      'marriageLeaveRemaining': marriageLeaveRemaining,
      'compassionateLeaveRemaining': compassionateLeaveRemaining,
      'annualLeaveRequests': annualLeaveRequests,
      'sickLeaveRequests': sickLeaveRequests,
      'hospitalisationLeaveRequests':hospitalisationLeaveRequests,
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

  String getLeaveBalance(String? leaveType) {
    if (leaveType == null) return "0";

    switch (leaveType) {
      case 'Annual Leave':
        return leaveValues['annualLeaveRemaining']?.toString() ?? "0";
      case 'Sick Leave':
        return leaveValues['sickLeaveRemaining']?.toString() ?? "0";
      case 'Hospitalisation Leave':
        return leaveValues['hospitalisationLeaveRemaining']?.toString() ?? "0";
      case 'Maternity Leave':
        return leaveValues['maternityLeaveRemaining']?.toString() ?? "0";
      case 'Paternity Leave':
        return leaveValues['paternityLeaveRemaining']?.toString() ?? "0";
      case 'Marriage Leave':
        return leaveValues['marriageLeaveRemaining']?.toString() ?? "0";
      case 'Compassionate Leave':
        return leaveValues['compassionateLeaveRemaining']?.toString() ?? "0";
      default:
        print("Unknown leave type: $leaveType");
        return "0";
    }
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller, bool isFromDate) async {
    DateTime initialDate = DateTime.now(); // Default to current date for initial selection

    if (!isFromDate && _fromDate == null) {
      _showErrorDialog(context, "Please select the From Date first.");
      return; // Exit early as "To Date" should not be selected before "From Date"
    }

    if (!isFromDate) {
      // If selecting "To Date", ensure it starts from "From Date"
      initialDate = _fromDate ?? DateTime.now(); // Default initial date is the selected "From Date"
    }

    // Show the date picker
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: isFromDate ? DateTime.now() : _fromDate!,
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
        controller.text = formattedDate;

        if (isFromDate) {
          _fromDate = pickedDate.toLocal(); // Ensure using local time
        } else {
          // Validate if "To Date" is selected before "From Date"
          if (pickedDate.isBefore(_fromDate!)) {
            _showErrorDialog(context, "To Date must be on or after From Date.");
            return; // Exit early if the date is invalid
          }
          _toDate = pickedDate.toLocal(); // Ensure using local time
        }

        // Optionally calculate days between dates if both are selected
        if (_fromDate != null && _toDate != null) {
          _calculateDays();
        }
      });
    }
  }

  Future<List<DateTime>> getHolidays(int year, String s3Url) async {
    List<DateTime> holidays = [
      DateTime(2024, 1, 1), // Default holidays
      DateTime(2024, 12, 25), // Brunei National Day
    ];

    try {
      final response = await http.get(Uri.parse(s3Url));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);

        if (jsonData.containsKey('CompanyHolidays2025') && jsonData['CompanyHolidays2025'] is List) {
          List<dynamic> fetchedHolidays = jsonData['CompanyHolidays2025'];
          for (var holiday in fetchedHolidays) {
            if (holiday.containsKey('date')) {
              // Handle single-day holidays
              holidays.add(parseCustomDate(holiday['date']));
            } else if (holiday.containsKey('dates')) {
              // Handle multi-day holidays (like Hari Raya)
              List<dynamic> holidayDates = holiday['dates'];
              holidayDates.forEach((date) {
                holidays.add(parseCustomDate(date));
              });
            }
          }
        }
      } else {
        print('Failed to fetch holidays. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching holidays: $e');
    }

    // Adjust for Sundays (if holiday falls on Sunday, add Monday as holiday)
    List<DateTime> adjustedHolidays = holidays.toSet().toList();
    for (DateTime holiday in holidays) {
      if (holiday.weekday == DateTime.sunday) {
        adjustedHolidays.add(holiday.add(Duration(days: 1))); // Add Monday as a holiday
      }
    }
    return adjustedHolidays.toSet().toList(); // Ensure uniqueness
  }

  DateTime parseCustomDate(String rawDate) {
    try {
      // Remove the weekday name and any ordinal suffix (st, nd, rd, th)
      String cleanedDate = rawDate.replaceFirst(RegExp(r'^[A-Za-z]+,?\s*'), ''); // Remove weekday name
      cleanedDate = cleanedDate.replaceAllMapped(RegExp(r'(\d+)(st|nd|rd|th)'), (match) => match.group(1)!); // Remove ordinal suffixes

      // Parse the date in the format "d MMMM yyyy"
      return DateFormat('d MMMM yyyy').parse(cleanedDate);
    } catch (e) {
      print('Error parsing date: $rawDate, $e');
      return DateTime.now();
    }
  }

  Future<void> _calculateDays() async {
    if (_fromDate != null && _toDate != null) {
      // Fetch holidays for the year
      List<DateTime> holidays = await getHolidays(
        _fromDate!.year,
        'https://commonfiles.s3.ap-southeast-1.amazonaws.com/Leave+Details/CompanyHolidays2025.json',
      );

      // Handle holidays spanning across different years
      if (_fromDate!.year != _toDate!.year) {
        holidays.addAll(await getHolidays(
          _toDate!.year,
          'https://commonfiles.s3.ap-southeast-1.amazonaws.com/Leave+Details/CompanyHolidays2025.json',
        ));
      }

      // Sort holidays and remove duplicates
      holidays.sort();
      Set<DateTime> holidaySet = holidays.map((e) => DateTime(e.year, e.month, e.day)).toSet();

      DateTime currentDate = _fromDate!;
      double totalDays = 0;

      while (!currentDate.isAfter(_toDate!)) {
        bool isHoliday = holidaySet.contains(currentDate);
        bool isSunday = currentDate.weekday == DateTime.sunday;

        if (isHoliday || isSunday) {
          // Skip holidays and Sundays
          currentDate = currentDate.add(Duration(days: 1));
          continue;
        }

        // Count valid working days
        totalDays++;
        currentDate = currentDate.add(Duration(days: 1));
      }

      // If "from" and "to" dates are the same, count as 1 day
      if (_fromDate!.isAtSameMomentAs(_toDate!)) {
        totalDays = 1;
      }

      // Handle half-day scenario
      if (isHalfDay) {
        totalDays = (_fromDate == _toDate) ? 0.5 : totalDays - 0.5;
      }

      // Update the UI with the calculated total days
      days.text = totalDays.toString();
    }
  }



  bool _validateFields() {
    bool isValid = true;

    setState(() {
      // Reset all error messages
      leaveTypeError = null;
      fromDateError = null;
      toDateError = null;
      applyToError = null;
      ticketError = null;
      reasonError = null;
      certificateError = null; // Reset certificate error

      // Validate Leave Type
      if (_selectedLeaveType == null || _selectedLeaveType!.isEmpty) {
        leaveTypeError = '* Please Select Type';
        isValid = false;
      }

      // Validate From Date
      if (from.text.isEmpty) {
        fromDateError = '* Please select Date';
        isValid = false;
      }

      // Validate To Date
      if (to.text.isEmpty) {
        toDateError = '* Please select Date';
        isValid = false;
      }

      // Validate Apply To (Manager or Superior checkbox)
      if (!isManager && !isSupervisor) {
        applyToError = '* Please select either Manager or Superior.';
        isValid = false;
      }

      // Validate Reason
      if (reason.text.isEmpty) {
        reasonError = '* Please give your reason';
        isValid = false;
      }

      // Validate Medical Certificate for Sick Leave
      if ((_selectedLeaveType == 'Sick Leave' || _selectedLeaveType == 'Hospitalisation Leave') && fileName == null) {
        certificateError = '* Medical certificate required for $_selectedLeaveType';
        isValid = false;
      }
    });

    return isValid;
  }


  List<String> applyTo = [];

  List<String> _getApplyToList() {
    applyTo.clear(); // Clear the list to avoid duplications

    // Check if Manager checkbox is selected
    if (isManager) {
      applyTo.add('Manager');
    }

    // Check if Superior checkbox is selected
    if (isSupervisor) {
      applyTo.add('Supervisor');
    }

    return applyTo; // Return the list of selected roles
  }


  String? fileName; // Variable to store the name of the selected file
  String? medicalCertificateUrl;

  Future<void> applyForLeave() async {
    final box = GetStorage();
    String empId = box.read('userId') ?? '';
    String supervisorName = box.read('supervisorName') ?? 'N/A';
    print(supervisorName);
    String managerName = box.read('managerName') ?? 'N/A';
    print(managerName);
    String supervisorEmpID = box.read('supervisorEmpID') ?? '';
    String managerEmpID = box.read('managerEmpID') ?? '';

    try {
      DateTime? fromDate;
      DateTime? toDate;

      // Parse the dates
      try {
        fromDate = DateFormat('dd/MM/yyyy').parse(from.text); // Convert to UTC
        // print(fromDate);
        toDate = DateFormat('dd/MM/yyyy').parse(to.text);
        // print(toDate);
      } catch (e) {
        Get.defaultDialog(
          title: 'Error',
          content: Text('Invalid date format. Please use dd/MM/yyyy.'),
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
        return;
      }

      // Check for valid date range
      if (fromDate == null || toDate == null || fromDate.isAfter(toDate)) {
        Get.defaultDialog(
          title: 'Error',
          content: Text('Invalid date selection. Please check the from and to dates.'),
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
        return;
      }

      // Parse number of days
      double numberOfDays;
      try {
        numberOfDays = double.parse(days.text);
      } catch (e) {
        Get.defaultDialog(
          title: 'Error',
          content: Text('Invalid number of days. Please enter a valid number.'),
          confirmTextColor: Colors.white,
          onConfirm: () => Get.back(),
        );
        return;
      }

      // Set the medical certificate URL if it exists
      String? medicalCertificate = medicalCertificateUrl;
      List<String> applyToList = _getApplyToList();

      // Create LeaveStatus object
      final leaveStatus = LeaveStatus(
        empID: empId,
        leaveType: _selectedLeaveType!,
        fromDate: TemporalDateTime(fromDate),
        toDate: TemporalDateTime(toDate),
        days: numberOfDays,
        applyTo: applyToList,
        reason: reason.text,
        medicalCertificate: medicalCertificate,
        supervisorStatus: 'Pending',
        managerStatus: 'Pending',
        empStatus: 'Pending',
        supervisorName: supervisorName,
        managerName: managerName,
      );

      // Show confirmation dialog before proceeding
      Get.defaultDialog(
        title: 'Confirm',
        content: Text('Are you sure you want to apply for ${_selectedLeaveType}?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Close the dialog for "No"
            child: Text('No', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () async {
              Get.back(); // Close the confirmation dialog

              // Submit leave request
              final request = ModelMutations.create(leaveStatus);
              final response = await Amplify.API.mutate(request: request).response;

              if (response.errors.isEmpty && response.data != null) {
                // Show success dialog
                Get.defaultDialog(
                  title: 'Success',
                  content: Text('Your leave application has been submitted.'),
                  onConfirm: () {
                    Get.back(); // Close dialog
                    Get.off(DashBoardScreeen()); // Navigate to dashboard
                  },
                );

                // Proceed with notifications and storing data in the background
                Future.microtask(() async {
                  if (applyToList.contains('Supervisor') && supervisorEmpID.isNotEmpty) {
                    _notifyUser(supervisorEmpID, leaveStatus, supervisorName);
                  }
                  if (applyToList.contains('Manager') && managerEmpID.isNotEmpty) {
                    _notifyUser(managerEmpID, leaveStatus, managerName);
                  }

                  // Send emails and store email notifications
                  if (supervisorEmail != 'N/A') {
                    bool emailSent = await sendEmail(supervisorEmail, employeeName);
                    if (emailSent) {
                      await storeEmailNotification(empId, _selectedLeaveType!, 'leave_no-reply@adininworks.com', supervisorEmail);
                    }
                  }
                  if (managerEmail != 'N/A') {
                    bool emailSent = await sendEmail(managerEmail, employeeName);
                    if (emailSent) {
                      await storeEmailNotification(empId, _selectedLeaveType!, 'leave_no-reply@adininworks.com', managerEmail);
                    }
                  }
                });
              } else {
                // Show error dialog if submission failed
                Get.defaultDialog(
                  title: 'Error',
                  content: Text('Failed to submit the leave application.'),
                  confirmTextColor: Colors.white,
                  onConfirm: () => Get.back(),
                );
              }
            },
            child: Text('Yes', style: TextStyle(color: Colors.green)),
          ),
        ],
      );

    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        content: Text('An error occurred: $e'),
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    }
  }


// Helper function to store email notification
  Future<void> storeEmailNotification(String empID, String leaveType, String senderEmail, String recipientEmail) async {
    final emailNotification = EmailNotifi(
      empID: empID,
      leaveType: leaveType,
      senderEmail: senderEmail,
      receipentEmail: [recipientEmail],
      status: 'Pending',
      message: 'Leave request notification sent by $employeeName',

    );

    try {
      final request = ModelMutations.create(emailNotification);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.errors.isEmpty && response.data != null) {
        print('Email notification stored successfully');
      } else {
        print('Error storing email notification: ${response.errors}');
      }
    } catch (e) {
      print('Exception while storing email notification: $e');
    }
  }


// Function to notify the selected user
  void _notifyUser(String empID, LeaveStatus leaveStatus, String name) {
    print('Notifying $name with empID $empID about leave application');
    // Your notification logic here
  }


  Future<bool> sendEmail(String managerEmail, String employeeName) async {
    // Create an instance of the AWS SES client
    final awsCredentials = AwsClientCredentials(
      accessKey: 'AKIAQXPZCWE7ZED5EI2A', // Replace with your AWS access key
      secretKey: 'LJwP2fd40b8OZoY28/0iLWr5op3eDTUZK7ugNcD3', // Replace with your AWS secret key
    );

    final ses = SES(
      region: 'ap-southeast-1', // e.g., 'us-east-1'
      credentials: awsCredentials,
    );


    final messageBody = 'Employee $employeeName applied leave request.\n'
        'You can view the details here: https://dev.dxtlxvdrz6jj5.amplifyapp.com';
    final subject = 'Leave request Notification';

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


  Future<void> uploadImage() async {
    // Select a file from the device with allowed file extensions
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: false,
      withReadStream: true,
      allowedExtensions: ['jpg', 'png', 'pdf'], // Only allow jpg, png, and pdf
    );

    if (result == null) {
      safePrint('No file selected');
      return;
    }

    final platformFile = result.files.single;

    // Check if the file extension is allowed
    String fileExtension = platformFile.extension?.toLowerCase() ?? '';
    if (fileExtension != 'jpg' && fileExtension != 'png' && fileExtension != 'pdf') {
      safePrint('Invalid file type selected. Only JPG, PNG, and PDF are allowed.');
      // Optionally show an error message to the user
      _showErrorDialog(context, 'Invalid file type. Only JPG, PNG, and PDF are allowed.');
      return;
    }

    // Update the file name to reflect in the UI
    setState(() {
      fileName = platformFile.name;
      certificateError = null;
    });

    try {
      final uploadResult = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          platformFile.readStream!,
          size: platformFile.size,
        ),
        path: StoragePath.fromString('public/${platformFile.name}'),
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;

      // Construct the full URL for the uploaded file
      String baseUrl = "https://aweadininstorage20242a2fe-dev.s3.ap-southeast-1.amazonaws.com/";
      medicalCertificateUrl = "$baseUrl${uploadResult.uploadedItem.path}"; // Set the full URL
      safePrint('Successfully uploaded: $medicalCertificateUrl');
      print(medicalCertificateUrl);
    } on StorageException catch (e) {
      safePrint(e.message);
    }
  }

  void onLeaveTypeChanged(String? newValue) {
    setState(() {
      _selectedLeaveType = newValue;

      // If the selected leave type is no longer 'Sick Leave', clear the certificate error
      if (_selectedLeaveType != 'Sick Leave') {
        certificateError = null;  // Clear the certificate error if not Sick Leave
      }
    });
  }



  //NAV BAR METHODS
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
              await _signOut(context); // Call the sign out method
            },
          ),
        ],
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await Amplify.Auth.signOut();

      await box.erase();
      Get.offAll(() => LoginScreen()); // Redirect to login screen
    } on AuthException catch (e) {
      _showErrorDialog(context, e.message);
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
        desktop: Scaffold(
            backgroundColor: Colors.white,
            body:SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    elevation: 1,
                    child: Container(
                      height: size.height * 0.085,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),bottomLeft: Radius.zero,bottomRight: Radius.zero),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 0.007,
                              top: size.height * 0.003,
                            ),
                            child: Container(
                              width: size.width * 0.145,
                              decoration: BoxDecoration(),
                              child: Image.asset('assets/images/awe logo.png'),
                            ),
                          ),

                          SizedBox(width: size.width * 0.75,),
                          GestureDetector(
                            onTap: (){
                              _confirmSignOut(context);
                            },
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  backgroundImage: image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
                                      ? NetworkImage(image) // Valid URL
                                      : null, // Fallback if image URL is empty or invalid
                                  radius: 23,
                                  child: image.isEmpty
                                      ? Icon(Icons.person, size: 20) // Icon as a fallback
                                      : null, // No child needed if there's an image
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.015,),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.15,),
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back,size: 20,color: Colors.black,)),
                      SizedBox(width: size.width * 0.28,),
                      Text('Apply Leave',style: TextStyle(fontFamily: 'Inter',fontSize: 18,fontWeight: FontWeight.bold,color: black),),
                    ],
                  ),
                  SizedBox(height: size.height * 0.013,),
                  Container(
                    width: size.width * 0.60,
                    height: size.height * 0.81,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300,width: 1),
                        color: pink
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.035,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.06,),
                              Text('Badge #:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.038,),
                              webContainer(context, badgeno),
                              SizedBox(width: size.width * 0.083,),
                              Text('Name:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.055,),
                              webContainer(context, employeeName),
                            ],
                          ),
                          SizedBox(height: size.height * 0.023,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.06,),
                              Text('Dept/Dev:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.033,),
                              webContainer(context, department),
                              SizedBox(width: size.width * 0.082,),
                              Text('Job Title:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.044,),
                              webContainer(context, position),
                            ],
                          ),
                          SizedBox(height: size.height * 0.025,),
                          Row(
                            // Align error message properly
                            children: [
                              SizedBox(width: size.width * 0.06,),
                              Text('Leave Type :',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.023),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Error message for Leave Type
                                  if (leaveTypeError != null)
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 4), // Adjust padding above dropdown
                                      child: Text(
                                        leaveTypeError!,
                                        style: TextStyle(color: Colors.red, fontSize: 12), // Error text styling
                                      ),
                                    ),

                                  // Leave Type Dropdown
                                  Container(
                                    width: size.width * 0.16,
                                    height: size.height * 0.038,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade400, // Keep the border color gray always
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.white,
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: _selectedLeaveType,
                                          hint: Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.005),
                                            child: Text(
                                              'Select Type',
                                              style: TextStyle(fontFamily: 'Inter', fontSize: 15, color: grey),
                                            ),
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedLeaveType = newValue;

                                              // Clear the leave type error when a value is selected
                                              leaveTypeError = null;

                                              // Check the selected leave type and set the corresponding error message
                                              if (_selectedLeaveType == 'Sick Leave' || _selectedLeaveType == 'Hospitalisation Leave') {
                                                certificateError = 'Medical certificate required';
                                              }  else {
                                                // Clear the certificate error for other leave types
                                                certificateError = null;
                                              }
                                            });
                                          },

                                          items: _leaveTypes.map((String leaveType) {
                                            return DropdownMenuItem<String>(
                                              value: leaveType,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: size.width * 0.01),
                                                child: Text(
                                                  leaveType,
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                          isExpanded: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: size.width * 0.047),
                              Text('Leave balance:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.018),
                              Container(
                                width: size.width * 0.123,
                                height: size.width * 0.018,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey.shade400,width: 1)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all( 4.0),
                                  child: Text(getLeaveBalance(_selectedLeaveType),style: TextStyle(color: Colors.grey.shade500,fontFamily: 'Inter',fontSize: 14),),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.025,),
                          Row(
                            children: [
                              //Half day
                              SizedBox(width: size.width * 0.06,),
                              Text('Half day:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.037,),
                              Container(
                                width: size.width * 0.016,
                                height: size.height * 0.030,
                                color: Colors.white,
                                child: Material(
                                  color: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isHalfDay = !isHalfDay; // Toggle half-day state
                                        if (_fromDate != null && _toDate != null) {
                                          _calculateDays(); // Recalculate days whenever half-day is toggled
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(color: Colors.grey, width: 1),
                                        color: isHalfDay ? Colors.blue : Colors.transparent, // Optional: change color when selected
                                      ),
                                      child: Center(
                                        child: isHalfDay
                                            ? Icon(Icons.check, color: Colors.white, size: 20) // Show tick icon when selected
                                            : null,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.14,),
                              Text('From',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.14,),
                              Text('To',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.160,),
                              Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align error messages properly
                            children: [
                              SizedBox(width: size.width * 0.06),
                              Text('Select Date:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width * 0.022),
                              // From Date Field
                              DateField(
                                controller: from,
                                errorMessage: fromDateError,
                                onTap: (context) => _selectDate(context, from, true),
                                onFieldTapped: () {
                                  setState(() {
                                    fromDateError = null; // Clear the error message when tapping the field
                                  });
                                },
                              ),
                              SizedBox(width: size.width * 0.040),
                              DateField(
                                controller: to,
                                errorMessage: toDateError,
                                onTap: (context) => _selectDate(context, to, false),
                                onFieldTapped: () {
                                  setState(() {
                                    toDateError = null; // Clear the error message when tapping the field
                                  });
                                },
                              ),
                              SizedBox(width: size.width * 0.046),
                              // Days TextField
                              Container(
                                width: size.width * 0.08,
                                height: size.height * 0.036,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.shade400, width: 1), // Set container border color
                                ),
                                child: TextField(
                                  controller: days,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none, // Remove the TextField's internal border
                                    contentPadding: EdgeInsets.all(14.0), // Optional: adjust padding as needed
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.03,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // Aligns error to the left
                            children: [
                              // Conditionally show the error message above the checkboxes
                              if (applyToError != null)
                                Padding(
                                  padding: EdgeInsets.only(left: size.width * 0.22, bottom: 4), // Align error message
                                  child: Text(
                                    applyToError!,
                                    style: TextStyle(color: Colors.red, fontSize: 12), // Styling for error message
                                  ),
                                ),

                              Row(
                                children: [
                                  SizedBox(width: size.width * 0.06),
                                  Text('Apply To:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                                  SizedBox(width: size.width * 0.035),
                                  Text('Manager',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                                  SizedBox(width: size.width * 0.015),
                                  Transform.scale(
                                    scale: 1.4, // Adjust this value to change the checkbox size
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isManager = !isManager; // Toggle the value
                                          applyToError = null; // Clear the error message when interacting
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.014,
                                        height: size.height * 0.023,
                                        color: Colors.white,
                                        child: Checkbox(
                                          value: isManager,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              isManager = newValue ?? false;
                                              applyToError = null; // Clear the error message
                                            });
                                          },
                                          side: BorderSide(
                                            color: Colors.grey.shade500, // Light grey border color
                                            width: 1,
                                          ),
                                          activeColor: Colors.blue, // Optional: change checkbox color when selected
                                          checkColor: Colors.white, // Optional: checkmark color
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.085),
                                  Text('Supervisor:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                                  SizedBox(width: size.width * 0.015),
                                  Transform.scale(
                                    scale: 1.4, // Adjust this value to change the checkbox size
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isSupervisor = !isSupervisor; // Toggle the value
                                          applyToError = null; // Clear the error message when interacting
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.014,
                                        height: size.height * 0.023,
                                        color: Colors.white,
                                        child: Checkbox(
                                          value: isSupervisor,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              isSupervisor = newValue ?? false;
                                              applyToError = null; // Clear the error message
                                            });
                                          },
                                          side: BorderSide(
                                            color: Colors.grey.shade500,
                                            width: 1,
                                          ),
                                          activeColor: Colors.blue,
                                          checkColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.028,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.14),
                              Text('If Sick Leave:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: size.height * 0.010,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: size.width * 0.13),
                                  if (certificateError != null)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0), // Adjust padding as needed
                                      child: Text(
                                        certificateError!,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: size.width * 0.14),
                                  Container(
                                    width: size.width * 0.14,
                                    height: size.height * 0.040,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400, width: 1),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: size.width * 0.004),
                                        Flexible(
                                          fit: FlexFit.tight, // Allows the text to take available space and adjust
                                          child: Text(
                                            fileName != null ? fileName! : 'Upload Medical Certificate',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 12,
                                              color: fileName != null ? Colors.black : Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis, // Truncate text with ellipsis if it's too long
                                            maxLines: 1, // Limit to one line of text
                                          ),
                                        ),
                                        SizedBox(width: size.width * 0.012),
                                        Spacer(),
                                        Transform.translate(
                                          offset: Offset(1, -3),
                                          child: IconButton(
                                            onPressed: () {
                                              uploadImage();
                                            },
                                            icon: Icon(
                                              Icons.file_upload_outlined,
                                              size: 21,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.030,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start, // Align error message properly
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.06, bottom: size.height * 0.090),
                                child: Text('Reason:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                              ),
                              SizedBox(width: size.width * 0.042), // Adjust space between label and text field as needed
                              // Reason TextField
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Error message for Reason
                                  if (reasonError != null)
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 4), // Adjust padding below error message
                                      child: Text(
                                        reasonError!,
                                        style: TextStyle(color: Colors.red, fontSize: 12), // Error text styling
                                      ),
                                    ),

                                  Container(
                                    width: size.width * 0.3, // Specify the width of the TextField
                                    height: size.height * 0.10,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400, width: 1),
                                    ),
                                    child: TextField(
                                      controller: reason,
                                      style: TextStyle(fontSize: 14), // Adjust text size within the TextField
                                      maxLines: null, // Allows the TextField to expand vertically
                                      expands: true, // Allows the TextField content to fill the available space
                                      textAlignVertical: TextAlignVertical.top, // Centers text vertically
                                      onChanged: (text) {
                                        // Clear the error message when the user types in the TextField
                                        setState(() {
                                          reasonError = null;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Text Here',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        contentPadding: EdgeInsets.only(top: size.height * 0.015, left: size.width * 0.010), // Padding inside the TextField
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          SizedBox(height: size.height * 0.010,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.20,),
                              RichText(
                                text: TextSpan(
                                  text: 'I have read and accept the ', // First part of the text
                                  style: TextStyle(
                                    color: Colors.black, // Default text color
                                    fontSize: 15,
                                    fontFamily: 'Inter',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'leave policies', // Clickable link
                                      style: TextStyle(
                                        color: Colors.blue, // Link color
                                        decoration: TextDecoration.underline, // Underline the link
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          const url = 'https://commonfiles.s3.ap-southeast-1.amazonaws.com/Policy/INSTRUCTION+FOR+APPLICATION+FOR+LEAVE+.pdf';
                                          if (await canLaunch(url)) {
                                            await launch(url, forceSafariVC: false); // Open in browser
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Could not launch the URL'),
                                              ),
                                            );
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.028,),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.22,),
                              OutlinedButton(
                                onPressed: () {
                                Get.back();
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(size.width * 0.070, size.height * 0.050), // Similar to minWidth and height in MaterialButton
                                  side: BorderSide(color: grey), // Define the border color for the outlined button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0), // Adjust the border radius as needed
                                  ),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03,),
                              Material(
                                borderRadius: BorderRadius.circular(45),
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (_validateFields()) {
                                      // Trigger the leave application process by calling applyForLeave
                                      await applyForLeave();
                                    }
                                  },
                                  minWidth: size.width * 0.070,
                                  height: size.height * 0.050,
                                  color: yellow,
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: size.height * 0.020,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.040,)
                ],
              ),
            )
        ),

        //TAB VIEW
        tablet: Scaffold(
          backgroundColor: Colors.white,
          body:
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 1,
                  child: Container(
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),bottomLeft: Radius.zero,bottomRight: Radius.zero),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.007,
                            top: size.height * 0.003,
                          ),
                          child: Container(
                            width: size.width * 0.145,
                            decoration: BoxDecoration(),
                            child: Image.asset('assets/images/awe logo.png'),
                          ),
                        ),

                        SizedBox(width: size.width * 0.75,),
                        GestureDetector(
                          onTap: (){
                            _confirmSignOut(context);
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundImage: image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
                                    ? NetworkImage(image) // Valid URL
                                    : null, // Fallback if image URL is empty or invalid
                                radius: 21,
                                child: image.isEmpty
                                    ? Icon(Icons.person, size: 22) // Icon as a fallback
                                    : null, // No child needed if there's an image
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.15,),
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.arrow_back,size: 20,color: Colors.black,)),
                    SizedBox(width: size.width * 0.28,),
                    Text('Apply Leave',style: TextStyle(fontFamily: 'Inter',fontSize: 18,fontWeight: FontWeight.bold,color: black),),
                  ],
                ),
                SizedBox(height: size.height * 0.015,),
                Container(
                  width: size.width * 0.85,
                  height: size.height * 0.82,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300,width: 1),
                      color: pink
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.035,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.10,),
                            Text('Badge #:',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.048,),
                            tabContainer(context, badgeno),
                            SizedBox(width: size.width * 0.067,),
                            Text('Name:',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.065,),
                            tabContainer(context, employeeName),
                          ],
                        ),
                        SizedBox(height: size.height * 0.025,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.10,),
                            Text('Dept/Dev:',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.041,),
                            tabContainer(context, department),
                            SizedBox(width: size.width * 0.064,),
                            Text('Job Title:',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.052,),
                            tabContainer(context, position),
                          ],
                        ),
                        SizedBox(height: size.height * 0.03,),
                        Row(// Align error message properly
                          children: [
                            SizedBox(width: size.width * 0.10),
                            Text('Leave type:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.028),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Error message for Leave Type
                                if (leaveTypeError != null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4), // Adjust padding below error message
                                    child: Text(
                                      leaveTypeError!,
                                      style: TextStyle(color: Colors.red, fontSize: 12), // Error text styling
                                    ),
                                  ),

                                // Leave Type Dropdown
                                Container(
                                  width: size.width * 0.16,
                                  height: size.width * 0.025,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400, // Keep the border color gray always
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.white,
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: _selectedLeaveType,
                                        hint: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            'Select Type',
                                            style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: grey),
                                          ),
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _selectedLeaveType = newValue;

                                            // Clear the leave type error when a value is selected
                                            leaveTypeError = null;

                                            // Check the selected leave type and set the corresponding error message
                                            if (_selectedLeaveType == 'Sick Leave' || _selectedLeaveType == 'Hospitalisation Leave') {
                                              certificateError = 'Medical certificate required';
                                            } else {
                                              // Clear the certificate error for other leave types
                                              certificateError = null;
                                            }
                                          });
                                        },
                                        items: _leaveTypes.map((String leaveType) {
                                          return DropdownMenuItem<String>(
                                            value: leaveType,
                                            child: Padding(
                                              padding: EdgeInsets.only(left: size.width * 0.01),
                                              child: Text(
                                                leaveType,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 25,
                                          color: Colors.black,
                                        ),
                                        isExpanded: true, // Ensures the dropdown takes full width
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: size.width * 0.065),
                            Text('Leave Balance:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.018),
                            Container(
                              width: size.width * 0.16,
                              height: size.width * 0.025,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.shade400,width: 1)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all( 4.0),
                                child: Text(getLeaveBalance(_selectedLeaveType),style: TextStyle(color: Colors.grey.shade500,fontFamily: 'Inter',fontSize: 14),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.04,),
                        Row(
                          children: [
                            //Half day
                            SizedBox(width: size.width * 0.10,),
                            Text('Half day:',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.048,),
                            Container(
                              width: size.width * 0.026,
                              height: size.height * 0.035,
                              color: Colors.white,
                              child: Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isHalfDay = !isHalfDay; // Toggle half-day state
                                      if (_fromDate != null && _toDate != null) {
                                        _calculateDays(); // Recalculate days whenever half-day is toggled
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: Colors.grey.shade400, width: 1),
                                      color: isHalfDay ? Colors.blue : Colors.transparent, // Optional: change color when selected
                                    ),
                                    child: Center(
                                      child: isHalfDay
                                          ? Icon(Icons.check, color: Colors.white, size: 20) // Show tick icon when selected
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.21,),
                            Text('From',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.155,),
                            Text('To',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.17,),
                            Text('No of days',style: TextStyle(fontFamily: 'Inter',fontSize: 14,color: black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: size.height * 0.009,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.10),
                            Text('Select Date:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.025),
                            // From Date Field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Error message for From Date
                                if (fromDateError != null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4), // Adjust padding below error message
                                    child: Text(
                                      fromDateError!,
                                      style: TextStyle(color: Colors.red, fontSize: 12), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.16,
                                  height: size.width * 0.025,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400)
                                  ),
                                  child: TextField(
                                    controller: from,
                                    style: TextStyle(fontSize: 12),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(12),
                                      suffixIcon: IconButton(
                                        padding: EdgeInsets.only(bottom: 0.05),
                                        onPressed: () => _selectDate(context, from, true),
                                        icon: Icon(
                                          Icons.calendar_today_outlined,
                                          size: 16,
                                          color: black,
                                        ),
                                      ),
                                      hintText: 'dd/mm/yyyy',
                                      hintStyle: TextStyle(fontSize: 14,),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: size.width * 0.03),
                            // To Date Field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Error message for To Date
                                if (toDateError != null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4), // Adjust padding below error message
                                    child: Text(
                                      toDateError!,
                                      style: TextStyle(color: Colors.red, fontSize: 12), // Error text styling
                                    ),
                                  ),

                                Container(
                                  width: size.width * 0.16,
                                  height: size.width * 0.025,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400)
                                  ),
                                  child: TextField(
                                    controller: to,
                                    style: TextStyle(fontSize: 12),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(12),
                                      hintText: 'dd/mm/yyyy',
                                      hintStyle: TextStyle(fontSize: 14,),
                                      suffixIcon: IconButton(
                                        padding: EdgeInsets.only(bottom: 0.05),
                                        onPressed: () => _selectDate(context, to, false),
                                        icon: Icon(
                                          Icons.calendar_today_outlined,
                                          size: 16,
                                          color: black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: size.width * 0.025),

                            // Days Field
                            Container(
                              width: size.width * 0.12,
                              height: size.width * 0.025,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey.shade400)
                              ),
                              child: TextField(
                                controller: days,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(14),
                                    border: InputBorder.none
                                ),
                                readOnly: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.03,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.10),
                            Text('Apply To:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.044),
                            Text('Manager:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.015),
                            Transform.scale(
                              scale: 1.3,
                              // Adjust this value to change the checkbox size
                              child: Checkbox(
                                value: isManager,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isManager = newValue ?? false;
                                  });// Validate all fields when user selects/deselects
                                },
                                side: BorderSide(
                                  color: Colors.grey.shade500, // Light grey border color
                                  width: 1,
                                ),
                                activeColor: Colors.blue, // Optional: change checkbox color when selected
                                checkColor: Colors.white, // Optional: checkmark color
                              ),
                            ),
                            SizedBox(width: size.width * 0.085),
                            Text('Supervisor:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            SizedBox(width: size.width * 0.015),
                            Transform.scale(
                              scale: 1.3, // Adjust this value to change the checkbox size
                              child: Checkbox(
                                value: isSupervisor,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isSupervisor = newValue ?? false;
                                  });
                                  // Validate all fields when user selects/deselects
                                },
                                side: BorderSide(
                                  color: Colors.grey.shade500,
                                  width: 1,
                                ),
                                activeColor: Colors.blue,
                                checkColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.025,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.205),
                            Text('If Sick leave:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: size.height * 0.010,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.20),
                                if (certificateError != null)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, bottom: 4.0), // Adjust padding as needed
                                    child: Text(
                                      certificateError!,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: size.width * 0.205),
                                Container(
                                    width: size.width * 0.22,
                                    height: size.height * 0.038,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey.shade400,width: 1)
                                    ),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: size.width * 0.004),
                                        Flexible(
                                          fit: FlexFit.tight, // Allows the text to take available space and adjust
                                          child: Text(
                                            fileName != null ? fileName! : 'Upload Medical Certificate',
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              color: fileName != null ? Colors.black : Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis, // Truncate text with ellipsis if it's too long
                                            maxLines: 1, // Limit to one line of text
                                          ),
                                        ),
                                        SizedBox(width: size.width * 0.012),
                                        Spacer(), // Space between text and icon
                                        Transform.translate( // Adjust the icon position with Transform.translate
                                          offset: Offset(1, -3), // Adjust the vertical offset as needed
                                          child: IconButton(
                                            onPressed: (){
                                              uploadImage();
                                            },
                                            icon: Icon(Icons.file_upload_outlined,size: 20,color: black,),

                                          ),
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.020,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start, // Ensures vertical alignment
                          children: <Widget>[
                            // Adjust space before the label as needed
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.106, bottom: size.height * 0.075),
                              child: Text('Reason:',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: size.width * 0.042), // Adjust space between label and textfield as needed
                            // Reason TextField with error message
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Error message for Reason
                                if (reasonError != null)
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2), // Adjust padding below the error message
                                    child: Text(
                                      reasonError!,
                                      style: TextStyle(color: Colors.red, fontSize: 12), // Error text styling
                                    ),
                                  ),
                                Container(
                                  width: size.width * 0.3, // Specify the width of the TextField
                                  height: size.height * 0.085,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.grey.shade400, width: 1)
                                  ),
                                  child: TextField(
                                    controller: reason,
                                    style: TextStyle(fontSize: 16), // Adjust text size within the TextField
                                    maxLines: null, // Allows the TextField to expand vertically
                                    expands: true, // Allows the TextField content to fill the available space
                                    textAlignVertical: TextAlignVertical.top, // Centers text vertically
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Text Here',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.only(top: 15, left: 10), // Padding inside the TextField
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.002,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.22,),
                            RichText(
                              text: TextSpan(
                                text: 'I have read and accept ', // First part of the text
                                style: TextStyle(
                                  color: Colors.black, // Default text color
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                ),
                                children: [
                                  TextSpan(
                                    text: 'the leave policies', // Clickable link
                                    style: TextStyle(
                                      color: Colors.blue, // Link color
                                      decoration: TextDecoration.underline, // Underline the link
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        const url = 'https://commonfiles.s3.ap-southeast-1.amazonaws.com/Policy/INSTRUCTION+FOR+APPLICATION+FOR+LEAVE+.pdf';
                                        if (await canLaunch(url)) {
                                          await launch(url, forceSafariVC: false); // Open in browser
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Could not launch the URL'),
                                            ),
                                          );
                                        }
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.width * 0.02,),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.25,),
                            OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size(size.width * 0.10, size.height * 0.050), // Similar to minWidth and height in MaterialButton
                                side: BorderSide(color: grey), // Define the border color for the outlined button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0), // Adjust the border radius as needed
                                ),
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
                            SizedBox(width: size.width * 0.02,),
                            Material(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.transparent,
                              child: MaterialButton(
                                onPressed: () async {
                                  if (_validateFields()) {
                                    // Trigger the leave application process by calling applyForLeave
                                    await applyForLeave();
                                  }
                                },
                                minWidth: size.width * 0.10,
                                height: size.height * 0.05,
                                color: yellow,
                                child: Text('Apply',style: TextStyle(fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.bold,color: black),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.010,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.025,),
              ],
            ),
          ),

        ),

        //M0BILE  VIEW
        mobile: Scaffold(
          backgroundColor: Colors.white,
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
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 0.3),
                      child: Container(
                        width: size.width * 0.280,
                        height: size.height * 0.0500,
                        child: Image.asset(
                          'assets/images/awe logo.png',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.552,
                    ),
                    GestureDetector(
                      onTap: () {
                        _confirmSignOut(context);
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundImage: image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
                                ? NetworkImage(image) // Valid URL
                                : null, // Fallback if image URL is empty or invalid
                            radius: 23,
                            child: image.isEmpty
                                ? Icon(Icons.person, size: 20) // Icon as a fallback
                                : null, // No child needed if there's an image
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                  ],
                ),
              ]),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.15,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: size.width * 0.18,
                    ),
                    Text(
                      'Apply Leave',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  width: size.width * 0.93,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.grey.shade300, width: 3),
                      color: pink),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.035,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            'Badge #:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.087,
                          ),
                          phoneContainer(context, badgeno),
                          SizedBox(
                            width: size.width * 0.084,
                          ),
                          Text(
                            'Name:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.049,
                          ),
                          phoneContainer(context, employeeName),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.034,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            'Dept/Dev:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.075,
                          ),
                          phoneContainer(context, department),
                          SizedBox(
                            width: size.width * 0.075,
                          ),
                          Text(
                            'Job Title:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.012,
                          ),
                          phoneContainer(context, position),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.034,
                      ),
                      Row(
                        // Align error message properly
                        children: [
                          SizedBox(
                            width: size.width * 0.033,
                          ),
                          SizedBox(width: size.width * 0.013),
                          Text(
                            'Leave balance:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: size.width * 0.011),
                          Container(
                            width: size.width * 0.207,
                            height: size.height * 0.030,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade400, width: 1.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Text(
                                getLeaveBalance(_selectedLeaveType),
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontFamily: 'Inter', fontSize: 13),
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.079),
                          Text(
                            'Half day:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.002,
                          ),
                          Container(
                            width: size.width * 0.059,
                            height: size.height * 0.026,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey
                                    .shade400, // Keep the border color gray always
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHalfDay =
                                  !isHalfDay; // Toggle half-day state
                                  if (_fromDate != null && _toDate != null) {
                                    _calculateDays(); // Recalculate days whenever half-day is toggled
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: isHalfDay
                                      ? Colors.blue
                                      : Colors
                                      .transparent, // Optional: change color when selected
                                ),
                                child: Center(
                                  child: isHalfDay
                                      ? Icon(Icons.check,
                                      color: Colors.white,
                                      size:
                                      20) // Show tick icon when selected
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.029,
                      ),
                      Row(
                        children: [
                          //Half day
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            'Leave Type:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: size.width * 0.050),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Error message for Leave Type
                              if (leaveTypeError != null)
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                      4), // Adjust padding above dropdown
                                  child: Text(
                                    leaveTypeError!,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 08), // Error text styling
                                  ),
                                ),
                              // Leave Type Dropdown
                              Container(
                                width: size.width * 0.32,
                                height: size.height * 0.032,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey
                                        .shade400, // Keep the border color gray always
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white,
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _selectedLeaveType,
                                      hint: Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.005),
                                        child: Text(
                                          'Select Type',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 11.5,
                                              color: grey),
                                        ),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedLeaveType = newValue;

                                          // Clear the leave type error when a value is selected
                                          leaveTypeError = null;

                                          // Check the selected leave type and set the corresponding error message
                                          if (_selectedLeaveType == 'Sick Leave' || _selectedLeaveType == 'Hospitalisation Leave') {
                                            certificateError = 'Medical certificate required';
                                          }  else {
                                            // Clear the certificate error for other leave types
                                            certificateError = null;
                                          }
                                        });
                                      },

                                      items:
                                      _leaveTypes.map((String leaveType) {
                                        return DropdownMenuItem<String>(
                                          value: leaveType,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.01),
                                            child: Text(
                                              leaveType,
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 9.5,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 23,
                                        color: Colors.black,
                                      ),
                                      isExpanded:
                                      true, // Ensures the dropdown takes full width
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.034,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.23,
                          ),
                          Text(
                            'From',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.179,
                          ),
                          Text(
                            'To',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.22,
                          ),
                          Text(
                            'No of days',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      Row(
                        // Align error messages properly
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            'Select Date:',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: size.width * 0.010),
                          // From Date TextField
                          PhoneField(
                            controller: from,
                            errorMessage: fromDateError,
                            onTap: (context) =>
                                _selectDate(context, from, true),
                            onFieldTapped: () {
                              setState(() {
                                fromDateError =
                                null; // Clear the error message when tapping the field
                              });
                            },
                          ),

                          SizedBox(width: size.width * 0.020),
                          PhoneField(
                            controller: to,
                            errorMessage: toDateError,
                            onTap: (context) => _selectDate(context, to, false),
                            onFieldTapped: () {
                              setState(() {
                                toDateError =
                                null; // Clear the error message when tapping the field
                              });
                            },
                          ),
                          // To Date TextField

                          SizedBox(width: size.width * 0.020),
                          // Days TextField
                          Container(
                            width: size.width * 0.175,
                            height: size.height * 0.033,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1)),
                            child: Material(
                              color: Colors.transparent,
                              child: TextField(
                                controller: days,
                                readOnly: true,
                                style: TextStyle(
                                  fontSize:
                                  11, // Set a smaller font size for the picked date
                                  color: Colors
                                      .black, // You can also control the color of the text
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(13.5),
                                  border: InputBorder.none,
                                ),
                                textAlignVertical: TextAlignVertical.bottom,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.028,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns error to the left
                        children: [
                          // Conditionally show the error message above the checkboxes
                          if (applyToError != null)
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.22,
                                  bottom: 2), // Align error message
                              child: Text(
                                applyToError!,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 08), // Styling for error message
                              ),
                            ),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.05),
                              Text(
                                'Apply To:',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: size.width * 0.045),
                              Text(
                                'Manager:',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: size.width * 0.015),
                              Transform.scale(
                                scale:
                                1.0, // Adjust this value to change the checkbox size
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isManager =
                                      !isManager; // Toggle the value
                                      applyToError =
                                      null; // Clear the error message when interacting
                                    });
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Checkbox(
                                      value: isManager,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          isManager = newValue ?? false;
                                          applyToError =
                                          null; // Clear the error message
                                        });
                                      },
                                      side: BorderSide(
                                        color: Colors.grey
                                            .shade500, // Light grey border color
                                        width: 1,
                                      ),
                                      activeColor: Colors
                                          .blue, // Optional: change checkbox color when selected
                                      checkColor: Colors
                                          .white, // Optional: checkmark color
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.065),
                              Text(
                                'Superior:',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: size.width * 0.015),
                              Transform.scale(
                                scale:
                                1.0, // Adjust this value to change the checkbox size
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSupervisor =
                                      !isSupervisor; // Toggle the value
                                      applyToError =
                                      null; // Clear the error message when interacting
                                    });
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Checkbox(
                                      value: isSupervisor,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          isSupervisor = newValue ?? false;
                                          applyToError =
                                          null; // Clear the error message
                                        });
                                      },
                                      side: BorderSide(
                                        color: Colors.grey.shade500,
                                        width: 1,
                                      ),
                                      activeColor: Colors.blue,
                                      checkColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.22),
                              Text(
                                'If Sick leave:',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.001,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: size.width * 0.24),
                                  if (certificateError != null)
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0), // Adjust padding as needed
                                      child: Text(
                                        certificateError!,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: size.width * 0.22),
                                  Container(
                                      width: size.width * 0.50,
                                      height: size.height * 0.038,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 1),
                                          borderRadius: BorderRadius.circular(4)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: size.width * 0.004),
                                          Flexible(
                                            fit: FlexFit.tight, // Allows the text to take available space and adjust
                                            child: Text(
                                              fileName != null ? fileName! : 'Upload Medical Certificate',
                                              style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 10,
                                                color: fileName != null ? Colors.black : Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis, // Truncate text with ellipsis if it's too long
                                              maxLines: 1, // Limit to one line of text
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.09),
                                          Spacer(), // Space between text and icon
                                          Transform.translate(
                                            // Adjust the icon position with Transform.translate
                                            offset: Offset(1,
                                                -3), // Adjust the vertical offset as needed
                                            child: IconButton(
                                              onPressed: () {
                                                uploadImage();
                                              },
                                              icon: Icon(
                                                Icons.file_upload_outlined,
                                                size: 16,
                                                color: black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Align label and text field vertically
                            children: <Widget>[
                              // Reason Label
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width *
                                        0.06), // Adjust left padding for the label
                                child: Container(
                                  child: Text(
                                    'Reason:',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: size.width *
                                      0.04), // Space between label and text field

                              // Reason TextField and Error Message
                              Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align error message and TextField on the left
                                children: [
                                  // Error message for Reason
                                  if (reasonError != null)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                          4), // Adjust padding below error message
                                      child: Text(
                                        reasonError!,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10, // Error text styling
                                        ),
                                      ),
                                    ),

                                  // Reason TextField
                                  Container(
                                    width: size.width *0.50,
                                    height: size.height * 0.06,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: TextField(
                                      controller: reason,
                                      style: TextStyle(
                                          fontSize:
                                          14), // Adjust text size within the TextField
                                      maxLines:
                                      null, // Allows the TextField to expand vertically
                                      expands:
                                      true, // Allows the TextField content to fill the available space
                                      textAlignVertical: TextAlignVertical
                                          .top, // Align text to the top of the TextField
                                      onChanged: (text) {
                                        setState(() {
                                          reasonError =
                                          null; // Clear the error message when the user types
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Text Here',
                                        border: InputBorder.none,
                                        hintStyle:
                                        TextStyle(color: Colors.grey),
                                        contentPadding: EdgeInsets.only(
                                          top: size.height * 0.015,
                                          left: size.width * 0.01,
                                        ), // Padding inside the TextField
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.18,
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                  'I have read and accept the ', // First part of the text
                                  style: TextStyle(
                                    color: Colors.black, // Default text color
                                    fontSize: 13,
                                    fontFamily: 'Inter',
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'leave policies', // Clickable link
                                      style: TextStyle(
                                        color: Colors.blue, // Link color
                                        decoration: TextDecoration
                                            .underline, // Underline the link
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          const url =
                                              'https://commonfiles.s3.ap-southeast-1.amazonaws.com/Policy/INSTRUCTION+FOR+APPLICATION+FOR+LEAVE+.pdf';
                                          if (await canLaunch(url)) {
                                            await launch(url,
                                                forceSafariVC:
                                                false); // Open in browser
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    'Could not launch the URL'),
                                              ),
                                            );
                                          }
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.035,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.25,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  Get.off(DashBoardScreeen());
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: Size(
                                      size.width * 0.010,
                                      size.height *
                                          0.035), // Similar to minWidth and height in MaterialButton
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
                                    fontFamily: 'Inter',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(45),
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (_validateFields()) {
                                      // Trigger the leave application process by calling applyForLeave
                                      await applyForLeave();
                                    }
                                  },
                                  minWidth: size.width * 0.17,
                                  height: size.height * 0.035,
                                  color: yellow,
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: black),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        paddingWidth: size.width * 0.1,
        bgColor: Colors.white);
  }
}










