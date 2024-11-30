import 'package:flutter/material.dart';

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

class TabTextField extends StatelessWidget {
  final TextEditingController controller2;
  final String text2;
  final IconData icon2;
  const TabTextField({super.key, required this.controller2, required this.text2, required this.icon2});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: Container(
        width: size.width * 0.26,
        height: size.height * 0.04,
        child: Material(
          color: Colors.white,
          child: TextField(
            controller: controller2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),  // Align the text vertically with the icon
              prefixIcon: Icon(
                icon2,
                color: Colors.grey,
                size: 19,  // Adjust icon size if needed
              ),
              hintText: text2,
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
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

class MobileTextField extends StatelessWidget {
  final TextEditingController controller3;
  final String text3;
  final IconData icon3;
  const MobileTextField(
      {super.key,
        required this.controller3,
        required this.text3,
        required this.icon3});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Card(
        elevation: 2,
        shadowColor: Colors.white,
        child: Container(
          width: size.width * 0.57,
          height: size.height * 0.045,
          child: Material(
            color: Colors.white,
            child: TextField(
              controller: controller3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10),
                // Align the text vertically with the icon
                prefixIcon: Icon(
                  icon3,
                  color: Colors.grey,
                  size: 16, // Adjust icon size if needed
                ),
                hintText: text3,
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
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
        )
    );
  }
}


class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final double height;

  PasswordTextField({
    required this.controller,
    this.hintText = 'Password',
    required this.width,
    required this.height,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Material(
          color: Colors.white,
          child: TextField(
            controller: widget.controller,
            obscureText: !_isPasswordVisible, // Hide or show the password
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),  // Align the text vertically with the icon
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
                size: 21,  // Adjust icon size if needed
              ),
              hintText: widget.hintText,
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
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility_outlined // Show this icon when password is visible
                      : Icons.visibility_off_outlined, // Show this icon when password is hidden
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


Widget webContainer(BuildContext context,String text){
  final Size size = MediaQuery.of(context).size;
  return    Container(
    width: size.width * 0.123,
    height: size.width * 0.018,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400,width: 1)
    ),
    child: Padding(
      padding:  EdgeInsets.all( 4.0),
      child: Text(text,style: TextStyle(color: Colors.grey.shade500,fontFamily: 'Inter',fontSize: 14),),
    ),
  );
}

Widget tabContainer(BuildContext context,String text){
  final Size size = MediaQuery.of(context).size;
  return    Container(
    width: size.width * 0.16,
    height: size.width * 0.025,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400,width: 1)
    ),
    child: Padding(
      padding:  EdgeInsets.all( 4.0),
      child: Text(text,style: TextStyle(color: Colors.grey.shade500,fontFamily: 'Inter',fontSize: 14),),
    ),
  );
}

Widget phoneContainer(BuildContext context, String text) {
  final Size size = MediaQuery.of(context).size;
  return Container(
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
        text,
        style: TextStyle(
            color: Colors.grey.shade500, fontFamily: 'Inter', fontSize: 13),
      ),
    ),
  );
}



// /*Map<String, int> calculateLeaveValues(List<LeaveStatus> leaveList) {
//   int currentYear = DateTime.now().year;
//
//   // Define the necessary variables
//   int lastCalculatedYear = currentYear;  // Initialize the lastCalculatedYear
//   int totalAnnualLeave = int.tryParse(annualLeave) ?? 0;
//   int totalSickLeave = int.tryParse(sickLeave) ?? 0;
//   int totalHospitalisationLeave =  60;
//   int totalMaternityLeave =  91;
//   int totalPaternityLeave =  2;
//   int totalMarriageLeave =  1;
//   int totalCompassionateLeave =  2;
//   int unpaidAuthorize = 0;  // Initialize unpaidAuthorize
//
//   // Check if the leave data needs to be reset for a new year
//   if (lastCalculatedYear != currentYear) {
//     // Reset total leaves to the default values for a new year
//     totalAnnualLeave = int.tryParse(annualLeave) ?? 0;
//     totalSickLeave = int.tryParse(sickLeave) ?? 0;
//     totalHospitalisationLeave = 60;
//     totalMaternityLeave = 91;
//     totalPaternityLeave =  2;
//     totalMarriageLeave =  1;
//     totalCompassionateLeave = 2;
//     unpaidAuthorize = 0;
//     // Update the last calculated year
//     lastCalculatedYear = currentYear;
//   }
//
//
//   int annualLeaveTaken = 0;
//   int sickLeaveTaken = 0;
//   int hospitalisationLeaveTaken = 0;
//   int maternityLeaveTaken = 0;
//   int paternityLeaveTaken = 0;
//   int marriageLeaveTaken = 0;
//   int compassionateLeaveTaken = 0;
//
//   int annualLeaveRequests = 0;
//   int sickLeaveRequests = 0;
//   int hospitalisationLeaveRequests = 0;
//   int maternityLeaveRequests = 0;
//   int paternityLeaveRequests = 0;
//   int marriageLeaveRequests = 0;
//   int compassionateLeaveRequests = 0;
//
//   int annualLeaveRemaining = totalAnnualLeave;
//   int sickLeaveRemaining = totalSickLeave;
//   int hospitalisationLeaveRemaining = totalHospitalisationLeave;
//   int maternityLeaveRemaining = totalMaternityLeave;
//   int paternityLeaveRemaining = totalPaternityLeave;
//   int marriageLeaveRemaining = totalMarriageLeave;
//   int compassionateLeaveRemaining = totalCompassionateLeave;
//
//   for (var leave in leaveList) {
//     if (leave.empStatus == 'Pending') {
//       String effectiveLeaveType = leave.leaveType;
//
//       // Compassionate leave handling when compassionate leave is exhausted
//       if (compassionateLeaveRemaining <= 0 && leave.leaveType == 'Compassionate Leave') {
//         // Treat exhausted compassionate leave as annual leave
//         effectiveLeaveType = 'Annual Leave';
//       }
//
//       if (leave.supervisorStatus == 'Pending' && leave.managerStatus == 'Pending') {
//         switch (effectiveLeaveType) {
//           case 'Annual Leave':
//             annualLeaveRequests++;
//             break;
//           case 'Sick Leave':
//             sickLeaveRequests++;
//             break;
//           case 'Hospitalisation Leave':
//             hospitalisationLeaveRequests++;
//             break;
//           case 'Maternity Leave':
//             maternityLeaveRequests++;
//             break;
//           case 'Paternity Leave':
//             paternityLeaveRequests++;
//             break;
//           case 'Marriage Leave':
//             marriageLeaveRequests++;
//             break;
//           case 'Compassionate Leave':
//             compassionateLeaveRequests++;
//             break;
//         }
//       }
//
//       if (leave.empStatus == 'Cancelled' && leave.supervisorStatus == 'Pending' && leave.managerStatus == 'Pending') {
//         switch (effectiveLeaveType) {
//           case 'Annual Leave':
//             annualLeaveRequests--;
//             break;
//           case 'Sick Leave':
//             sickLeaveRequests--;
//             break;
//           case 'Hospitalisation Leave':
//             hospitalisationLeaveRequests--;
//             break;
//           case 'Maternity Leave':
//             maternityLeaveRequests--;
//             break;
//           case 'Paternity Leave':
//             paternityLeaveRequests--;
//             break;
//           case 'Marriage Leave':
//             marriageLeaveRequests--;
//             break;
//           case 'Compassionate Leave':
//             compassionateLeaveRequests--;
//             break;
//         }
//       }
//       if (leave.empStatus == 'Pending' && leave.supervisorStatus == 'Rejected' && leave.managerStatus == 'Pending') {
//         switch (effectiveLeaveType) {
//           case 'Annual Leave':
//             annualLeaveRequests--;
//             break;
//           case 'Sick Leave':
//             sickLeaveRequests--;
//             break;
//           case 'Hospitalisation Leave':
//             hospitalisationLeaveRequests --;
//             break;
//           case 'Maternity Leave':
//             maternityLeaveRequests--;
//             break;
//           case 'Paternity Leave':
//             paternityLeaveRequests--;
//             break;
//           case 'Marriage Leave':
//             marriageLeaveRequests--;
//             break;
//           case 'Compassionate Leave':
//             compassionateLeaveRequests--;
//             break;
//         }
//       }
//
//       if (leave.empStatus == 'Pending' && leave.supervisorStatus == 'Pending' && leave.managerStatus == 'Rejected') {
//         switch (effectiveLeaveType) {
//           case 'Annual Leave':
//             annualLeaveRequests--;
//             break;
//           case 'Sick Leave':
//             sickLeaveRequests--;
//             break;
//           case 'Hospitalisation Leave':
//             hospitalisationLeaveRequests--;
//             break;
//           case 'Maternity Leave':
//             maternityLeaveRequests--;
//             break;
//           case 'Paternity Leave':
//             paternityLeaveRequests--;
//             break;
//           case 'Marriage Leave':
//             marriageLeaveRequests--;
//             break;
//           case 'Compassionate Leave':
//             compassionateLeaveRequests--;
//             break;
//         }
//       }
//
//
//
//       // Handling approved leave requests by supervisor and manager
//       if (leave.empStatus == 'Pending' && leave.supervisorStatus == 'Approved' && leave.managerStatus == 'Approved') {
//         int approvedDays = leave.days?.toInt() ?? 0;
//
//         switch (effectiveLeaveType) {
//           case 'Marriage Leave':
//             if (approvedDays > marriageLeaveRemaining) {
//               int excessDays = approvedDays - marriageLeaveRemaining;
//               marriageLeaveTaken += marriageLeaveRemaining;
//               marriageLeaveRemaining = 0;
//
//               if (annualLeaveRemaining >= excessDays) {
//                 annualLeaveTaken += excessDays;
//                 annualLeaveRemaining -= excessDays;
//               } else {
//                 int leftover = excessDays - annualLeaveRemaining;
//                 annualLeaveTaken += annualLeaveRemaining;
//                 annualLeaveRemaining = 0;
//
//                 sickLeaveTaken += leftover;
//                 sickLeaveRemaining -= leftover;
//               }
//             } else {
//               marriageLeaveTaken += approvedDays;
//               marriageLeaveRemaining -= approvedDays;
//             }
//             break;
//
//           case 'Paternity Leave':
//             if (approvedDays > paternityLeaveRemaining) {
//               int excessDays = approvedDays - paternityLeaveRemaining;
//               paternityLeaveTaken += paternityLeaveRemaining;
//               paternityLeaveRemaining = 0;
//
//               if (annualLeaveRemaining >= excessDays) {
//                 annualLeaveTaken += excessDays;
//                 annualLeaveRemaining -= excessDays;
//               } else {
//                 int leftover = excessDays - annualLeaveRemaining;
//                 annualLeaveTaken += annualLeaveRemaining;
//                 annualLeaveRemaining = 0;
//
//                 sickLeaveTaken += leftover;
//                 sickLeaveRemaining -= leftover;
//               }
//             } else {
//               paternityLeaveTaken += approvedDays;
//               paternityLeaveRemaining -= approvedDays;
//             }
//             break;
//
//           case 'Annual Leave':
//             annualLeaveTaken += approvedDays;
//             annualLeaveRemaining -= approvedDays;
//             break;
//
//           case 'Sick Leave':
//             sickLeaveTaken += approvedDays;
//             sickLeaveRemaining -= approvedDays;
//             break;
//
//           case 'Hospitalisation Leave':
//             hospitalisationLeaveTaken += approvedDays;
//             hospitalisationLeaveRemaining -= approvedDays;
//             break;
//
//           case 'Maternity Leave':
//             maternityLeaveTaken += approvedDays;
//             maternityLeaveRemaining -= approvedDays;
//             break;
//
//           case 'Compassionate Leave':
//             compassionateLeaveTaken += approvedDays;
//             compassionateLeaveRemaining -= approvedDays;
//             break;
//         }
//       }
//
//       // Handling cancelled leave requests
//       if (leave.empStatus == 'Cancelled' && leave.managerStatus == 'Approved') {
//         int canceledDays = leave.days?.toInt() ?? 0;
//
//         switch (effectiveLeaveType) {
//           case 'Marriage Leave':
//             marriageLeaveTaken -= canceledDays;
//             marriageLeaveRemaining += canceledDays;
//             break;
//           case 'Paternity Leave':
//             paternityLeaveTaken -= canceledDays;
//             paternityLeaveRemaining += canceledDays;
//             break;
//           case 'Annual Leave':
//             annualLeaveTaken -= canceledDays;
//             annualLeaveRemaining += canceledDays;
//             break;
//           case 'Sick Leave':
//             sickLeaveTaken -= canceledDays;
//             sickLeaveRemaining += canceledDays;
//             break;
//           case 'Hospitalisation Leave':
//             hospitalisationLeaveTaken -= canceledDays;
//             hospitalisationLeaveRemaining += canceledDays;
//             break;
//           case 'Maternity Leave':
//             maternityLeaveTaken -= canceledDays;
//             maternityLeaveRemaining += canceledDays;
//             break;
//           case 'Compassionate Leave':
//             compassionateLeaveTaken -= canceledDays;
//             compassionateLeaveRemaining += canceledDays;
//             break;
//         }
//       }
//
//       // Add unpaid authorize when all leave types are exhausted
//       if (annualLeaveRemaining <= 0 && sickLeaveRemaining <= 0) {
//         // Handle unpaid leave for extra days of Annual Leave or Sick Leave
//         if (leave.empStatus == 'Pending' &&
//             leave.supervisorStatus == 'Approved' &&
//             leave.managerStatus == 'Approved') {
//           int approvedDays = leave.days?.toInt() ?? 0;
//
//           // For Annual Leave or Sick Leave: Calculate unpaid days
//           if (leave.leaveType == 'Annual Leave' || leave.leaveType == 'Sick Leave') {
//             // Ensure deficits are calculated correctly
//             int annualDeficit = annualLeaveTaken - totalAnnualLeave;
//             int sickDeficit = sickLeaveTaken - totalSickLeave;
//
//             int unpaidDays = approvedDays;
//
//             // For Annual Leave or Sick Leave: Only consider deficits if they exist
//             if (annualDeficit > 0) {
//               unpaidDays -= annualDeficit;  // Subtract only the excess of annual leave taken
//             }
//
//             if (sickDeficit > 0) {
//               unpaidDays -= sickDeficit;    // Subtract only the excess of sick leave taken
//             }
//             // Add remaining approved days as unpaid leave if necessary
//             if (unpaidDays > 0) {
//               unpaidAuthorize += unpaidDays;  // Add unpaid leave based on the excess days
//             }
//
//           }
//           // For other leave types (Compassionate, Marriage, Paternity): Directly add unpaid leave
//           if ((leave.leaveType == 'Compassionate Leave' && compassionateLeaveRemaining <= 0) ||
//               (leave.leaveType == 'Marriage Leave' && marriageLeaveRemaining <= 0) ||
//               (leave.leaveType == 'Paternity Leave' && paternityLeaveRemaining <= 0)) {
//             if (leave.empStatus == 'Pending' &&
//                 leave.supervisorStatus == 'Approved' &&
//                 leave.managerStatus == 'Approved') {
//               unpaidAuthorize += approvedDays;
//             }
//           }
//         }
//       }
//
//
//
//     }
//   }
//
//   // Ensure no negative remaining days for any leave type
//   annualLeaveRemaining = annualLeaveRemaining < 0 ? 0 : annualLeaveRemaining;
//   sickLeaveRemaining = sickLeaveRemaining < 0 ? 0 : sickLeaveRemaining;
//   compassionateLeaveRemaining = compassionateLeaveRemaining < 0 ? 0 : compassionateLeaveRemaining;
//   marriageLeaveRemaining = marriageLeaveRemaining < 0 ? 0 : marriageLeaveRemaining;
//   paternityLeaveRemaining = paternityLeaveRemaining < 0 ? 0: paternityLeaveRemaining;
//   hospitalisationLeaveRemaining =hospitalisationLeaveRemaining < 0 ? 0: hospitalisationLeaveRemaining;
//   maternityLeaveRemaining = maternityLeaveRemaining < 0 ? 0: maternityLeaveRemaining;
//
//   // Ensure requests are non-negative
//   annualLeaveRequests = annualLeaveRequests < 0 ? 0 : annualLeaveRequests;
//   sickLeaveRequests = sickLeaveRequests < 0 ? 0 : sickLeaveRequests;
//   hospitalisationLeaveRequests = hospitalisationLeaveRequests < 0 ? 0 : hospitalisationLeaveRequests;
//   maternityLeaveRequests = maternityLeaveRequests < 0 ? 0 : maternityLeaveRequests;
//   paternityLeaveRequests = paternityLeaveRequests < 0 ? 0 : paternityLeaveRequests;
//   marriageLeaveRequests = marriageLeaveRequests < 0 ? 0 : marriageLeaveRequests;
//   compassionateLeaveRequests = compassionateLeaveRequests < 0 ? 0 : compassionateLeaveRequests;
//
//   return {
//     'totalAnnualLeave': totalAnnualLeave,
//     'totalSickLeave': totalSickLeave,
//     'totalHospitalisationLeave':totalHospitalisationLeave,
//     'totalMaternityLeave': totalMaternityLeave,
//     'totalPaternityLeave': totalPaternityLeave,
//     'totalMarriageLeave': totalMarriageLeave,
//     'totalCompassionateLeave': totalCompassionateLeave,
//     'annualLeaveTaken': annualLeaveTaken,
//     'sickLeaveTaken': sickLeaveTaken,
//     'hospitalisationLeaveTaken':hospitalisationLeaveTaken,
//     'maternityLeaveTaken': maternityLeaveTaken,
//     'paternityLeaveTaken': paternityLeaveTaken,
//     'marriageLeaveTaken': marriageLeaveTaken,
//     'compassionateLeaveTaken': compassionateLeaveTaken,
//     'unpaidAuthorize': unpaidAuthorize,
//     'annualLeaveRemaining': annualLeaveRemaining,
//     'sickLeaveRemaining': sickLeaveRemaining,
//     'hospitalisationLeaveRemaining':hospitalisationLeaveRemaining,
//     'maternityLeaveRemaining': maternityLeaveRemaining,
//     'paternityLeaveRemaining': paternityLeaveRemaining,
//     'marriageLeaveRemaining': marriageLeaveRemaining,
//     'compassionateLeaveRemaining': compassionateLeaveRemaining,
//     'annualLeaveRequests': annualLeaveRequests,
//     'sickLeaveRequests': sickLeaveRequests,
//     'hospitalisationLeaveRequests':hospitalisationLeaveRequests,
//     'maternityLeaveRequests': maternityLeaveRequests,
//     'paternityLeaveRequests': paternityLeaveRequests,
//     'marriageLeaveRequests': marriageLeaveRequests,
//     'compassionateLeaveRequests': compassionateLeaveRequests,
//   };
// }/*