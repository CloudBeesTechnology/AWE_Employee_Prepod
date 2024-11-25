import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:awe_project/models/LeaveStatus.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../models/EmpPersonalInfo.dart';
import '../models/TicketRequest.dart';

Future<void> fetchEmployeePersonalInfo(BuildContext context) async {
  try {
    final box = GetStorage();
    // Get the stored user ID
    String empId = box.read('userId') ?? '';
    print('Fetched empID: $empId');  // Log empID for verification

    if (empId.isEmpty) {
      return; // User ID is missing; exit silently
    }


    final request = ModelQueries.list(EmpPersonalInfo.classType);
    final response = await Amplify.API.query(request: request).response;

    if (response.errors.isNotEmpty) {
      print('Errors: ${response.errors}');
      return;
    }

    List<EmpPersonalInfo?> employeeInfos = response.data?.items ?? [];

    if (employeeInfos.isNotEmpty) {
      EmpPersonalInfo? employeeInfo = employeeInfos.firstWhere(
            (e) => e?.empID == empId,
        orElse: () => null,
      );
      print('Employee Info: $employeeInfo');  // Log employeeInfo object

      if (employeeInfo != null) {
        print('Profile Photo URL: ${employeeInfo.profilePhoto}');  // Log profile photo URL

        // Store employee data locally
        box.write('name', employeeInfo.name ?? 'N/A');
        box.write('email', employeeInfo.email ?? 'N/A');
        box.write('contactNo', employeeInfo.contactNo ?? 'N/A');
        box.write('badgeNo', employeeInfo.empBadgeNo ?? 'N/A');
        box.write('position', employeeInfo.position ?? 'N/A');
        box.write('image', employeeInfo.profilePhoto ?? '');  // Save empty string if null
        box.write('emptype', employeeInfo.empType ?? 'N/A');
        print('Employee personal info stored for user: $empId');
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

String employeeName ='';
String employeeEmail='' ;
String contactNo='';
String position='';
String badgeno='' ;
String image='' ;
String empType ='';


class RecentLeaveTable extends StatefulWidget {
  final List<LeaveStatus> filteredLeaveData;
  final TextStyle headerTextStyle;
  final TextStyle rowTextStyle;
  final void Function(BuildContext, int, LeaveStatus) onCellTap;

  const RecentLeaveTable({
    Key? key,
    required this.filteredLeaveData,
    required this.headerTextStyle,
    required this.rowTextStyle,
    required this.onCellTap,
  }) : super(key: key);

  @override
  _RecentLeaveTableState createState() => _RecentLeaveTableState();
}

class _RecentLeaveTableState extends State<RecentLeaveTable> {
  TextStyle _rowTextStyle(Size size) {
    double fontSize;
    if (size.width > 1200) {
      fontSize = 13; // Desktop
    } else if (size.width > 800) {
      fontSize = 10; // Tablet
    } else {
      fontSize = 8; // Mobile
    }

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  double _getColumnSpacing(Size size) {
    if (size.width > 1200) return size.width * 0.043; // Desktop
    if (size.width > 800) return size.width * 0.040; // Tablet
    return size.width * 0.015; // Mobile
  }

  double _getHeadingRowHeight(Size size) {
    if (size.width > 1200) return size.height * 0.050; // Desktop
    if (size.width > 800) return size.height * 0.045; // Tablet
    return size.height * 0.040; // Mobile
  }

  double _getDataRowHeight(Size size) {
    if (size.width > 1200) return size.height * 0.050; // Desktop
    if (size.width > 800) return size.height * 0.043; // Tablet
    return size.height * 0.039; // Mobile
  }

  EdgeInsets _getPadding(Size size) {
    if (size.width > 1200) {
      return EdgeInsets.only(left: size.width * 0.170, top: size.height * 0.025); // Desktop
    } else if (size.width > 800) {
      return EdgeInsets.only(left: size.width * 0.120, top: size.height * 0.020); // Tablet
    } else {
      return EdgeInsets.only(left: size.width * 0.050, top: size.height * 0.015); // Mobile
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: _getPadding(size),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: widget.filteredLeaveData.isNotEmpty
            ? SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            headingRowHeight: _getHeadingRowHeight(size),
            dataRowHeight: _getDataRowHeight(size),
            columnSpacing: _getColumnSpacing(size),
            columns: [
              DataColumn(label: Text('Leave Type', style: widget.headerTextStyle)),
              DataColumn(label: Text('From', style: widget.headerTextStyle)),
              DataColumn(label: Text('To', style: widget.headerTextStyle)),
              DataColumn(label: Text('Days', style: widget.headerTextStyle)),
              DataColumn(label: Text('Reason', style: widget.headerTextStyle)),
              DataColumn(label: Text('Approver', style: widget.headerTextStyle)),
              DataColumn(label: Text('Status', style: widget.headerTextStyle)),
            ],
            rows: widget.filteredLeaveData.map((leave) {
              int index = widget.filteredLeaveData.indexOf(leave);
              return DataRow(
                cells: [
                  DataCell(
                    Text(leave.leaveType ?? '', style: widget.rowTextStyle),
                    onTap: () => widget.onCellTap(context, index, leave),
                  ),
                  DataCell(
                    Text(
                      leave.fromDate != null
                          ? DateFormat('dd/MM/yyyy').format(leave.fromDate!.getDateTimeInUtc().toLocal())
                          : '',
                      style: widget.rowTextStyle,
                    ),
                    onTap: () => widget.onCellTap(context, index, leave),
                  ),
                  DataCell(
                    Text(
                      leave.toDate != null
                          ? DateFormat('dd/MM/yyyy').format(leave.toDate!.getDateTimeInUtc().toLocal())
                          : '',
                      style: widget.rowTextStyle,
                    ),
                    onTap: () => widget.onCellTap(context, index, leave),
                  ),
                  DataCell(
                    Text('${leave.days ?? 0} days', style: widget.rowTextStyle),
                    onTap: () => widget.onCellTap(context, index, leave),
                  ),
                  DataCell(
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:  ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width * 0.13), // You can adjust the max width
                        child: Text(
                          leave.reason ?? '',
                          style: widget.rowTextStyle,
                          softWrap: true, // This ensures wrapping
                          overflow: TextOverflow.visible, // Avoids overflow
                        ),
                      ),
                    ),
                    onTap: () => widget.onCellTap(context, index, leave),
                  ),
                  DataCell(
                    Text(
                      leave.applyTo != null && leave.applyTo is List
                          ? (leave.applyTo as List).join(', ')
                          : leave.applyTo?.toString() ?? '',
                      style: widget.rowTextStyle,
                    ),
                    onTap: () => widget.onCellTap(context, index, leave),
                  ),
                  DataCell(
                    Text(
                      _getLeaveStatus(leave),
                      style: widget.rowTextStyle.copyWith(
                        color: _getStatusColor(leave),
                      ),
                    ),
                    onTap: () => widget.onCellTap(context, index, leave),
                  ),
                ],
              );
            }).toList(),
          ),
        )
            : SizedBox(),
      ),
    );
  }

  String _getLeaveStatus(LeaveStatus leave) {
    if (leave.empStatus == 'Cancelled') return '${leave.empStatus}';
    if (leave.managerStatus == 'Approved' || leave.managerStatus == 'Rejected') return '${leave.managerStatus}';
    if (leave.supervisorStatus == 'Rejected') return '${leave.supervisorStatus}';
    return '${leave.empStatus}';
  }

  Color _getStatusColor(LeaveStatus leave) {
    if (leave.empStatus == 'Cancelled') return Colors.black;
    if (leave.managerStatus == 'Approved') return Colors.green;
    if (leave.managerStatus == 'Rejected' || leave.supervisorStatus == 'Rejected') return Colors.red;
    return Colors.black;
  }
}


class ReviewTicketTable extends StatelessWidget {
  final Size size;
  final List<TicketRequest> filteredTicketRequests;
  final Function(BuildContext, int, TicketRequest?) onCellTap;

  ReviewTicketTable({
    required this.size,
    required this.filteredTicketRequests,
    required this.onCellTap,
  });

  String getEmployeeInfo(String key) {
    final box = GetStorage();
    return box.read(key) ?? 'N/A';
  }

  TextStyle getResponsiveHeaderTextStyle(Size size) {
    double fontSize;
    if (size.width > 1200) {
      fontSize = 14; // Desktop
    } else if (size.width > 800) {
      fontSize = 13; // Tablet
    } else {
      fontSize = 12; // Mobile
    }
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  TextStyle getResponsiveRowTextStyle(Size size) {
    double fontSize;
    if (size.width > 1200) {
      fontSize = 13; // Desktop
    } else if (size.width > 800) {
      fontSize = 12; // Tablet
    } else {
      fontSize = 11; // Mobile
    }
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: fontSize,
      color: Colors.black,
    );
  }

  double getColumnSpacing(Size size) {
    if (size.width > 1200) return size.width * 0.026; // Desktop
    if (size.width > 800) return size.width * 0.018; // Tablet
    return size.width * 0.015; // Mobile
  }

  double getHeadingRowHeight(Size size) {
    if (size.width > 1200) return size.height * 0.050; // Desktop
    if (size.width > 800) return size.height * 0.045; // Tablet
    return size.height * 0.040; // Mobile
  }

  double getDataRowHeight(Size size) {
    if (size.width > 1200) return size.height * 0.048; // Desktop
    if (size.width > 800) return size.height * 0.043; // Tablet
    return size.height * 0.038; // Mobile
  }

  EdgeInsets getPadding(Size size) {
    if (size.width > 1200) {
      return EdgeInsets.only(left: size.width * 0.170, top: size.height * 0.025); // Desktop
    } else if (size.width > 800) {
      return EdgeInsets.only(left: size.width * 0.112, top: size.height * 0.020); // Tablet
    } else {
      return EdgeInsets.only(left: size.width * 0.050, top: size.height * 0.015); // Mobile
    }
  }

  String getStatusText(TicketRequest request) {
    if (request.empStatus == 'Cancelled') return request.empStatus!;
    if (request.hrStatus == 'Approved' || request.hrStatus == 'Rejected') return request.hrStatus ?? 'Unknown';
    return request.empStatus ?? 'Pending';
  }

  Color getStatusColor(TicketRequest request) {
    if (request.empStatus == 'Cancelled') return Colors.black;
    if (request.hrStatus == 'Approved') return Colors.green;
    if (request.hrStatus == 'Rejected') return Colors.red;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headerTextStyle = getResponsiveHeaderTextStyle(size);
    TextStyle rowTextStyle = getResponsiveRowTextStyle(size);

    return Padding(
      padding: getPadding(size),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: filteredTicketRequests.isNotEmpty
            ? SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              headingRowHeight: getHeadingRowHeight(size),
              dataRowHeight: getDataRowHeight(size),
              columnSpacing: getColumnSpacing(size),
              columns: [
                DataColumn(label: Text('Name', style: headerTextStyle)),
                DataColumn(label: Text('Badge Number', style: headerTextStyle)),
                DataColumn(label: Text('Department', style: headerTextStyle)),
                DataColumn(label: Text('Position', style: headerTextStyle)),
                DataColumn(label: Text('Destination', style: headerTextStyle)),
                DataColumn(label: Text('Departure Date', style: headerTextStyle)),
                DataColumn(label: Text('Arrival Date', style: headerTextStyle)),
                DataColumn(label: Text('Status', style: headerTextStyle)),
              ],
              rows: filteredTicketRequests.map((request) {
                int index = filteredTicketRequests.indexOf(request);
                return DataRow(
                  cells: [
                    DataCell(
                      Text(getEmployeeInfo('name'), style: rowTextStyle),
                      onTap: () => onCellTap(context, index, request),
                    ),
                    DataCell(
                      Text(getEmployeeInfo('badgeNo'), style: rowTextStyle),
                      onTap: () => onCellTap(context, index, request),
                    ),
                    DataCell(Text(getEmployeeInfo('department'), style: rowTextStyle), onTap: () => onCellTap(context, index, request)),
                    DataCell(
                      Text(getEmployeeInfo('position'), style: rowTextStyle),
                      onTap: () => onCellTap(context, index, request),
                    ),
                    DataCell(Text(request.destination ?? 'Unknown', style: rowTextStyle), onTap: () => onCellTap(context, index, request)),
                    DataCell(
                      Text(
                        request.departureDate != null ? DateFormat('dd/MM/yyyy').format(request.departureDate!.getDateTimeInUtc().toLocal()) : 'N/A',
                        style: rowTextStyle,
                      ),
                      onTap: () => onCellTap(context, index, request),
                    ),
                    DataCell(
                      Text(
                        request.departureDate != null ? DateFormat('dd/MM/yyyy').format(request.arrivalDate!.getDateTimeInUtc().toLocal()) : 'N/A',
                        style: rowTextStyle,
                      ),
                      onTap: () => onCellTap(context, index, request),
                    ),
                    DataCell(
                      Text(
                        getStatusText(request),
                        style: rowTextStyle.copyWith(
                          color: getStatusColor(request),
                        ),
                      ),
                      onTap: () => onCellTap(context, index, request),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        )
            : SizedBox(),
      ),
    );
  }
}
