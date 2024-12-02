import 'package:flutter/material.dart';



class DateField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorMessage;
  final Function(BuildContext context) onTap;
  final Function? onFieldTapped; // New callback to clear error

  const DateField({
    Key? key,
    required this.controller,
    this.errorMessage,
    required this.onTap,
    this.onFieldTapped, // Add the new parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Error message
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4), // Adjust padding below error message
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12), // Error text styling
            ),
          ),
        Container(
          width: size.width * 0.125, // Adjust width for better layout
          height: size.height * 0.038,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.text.isEmpty ? 'dd/mm/yyyy' : controller.text, // Display placeholder or entered date
                  style: TextStyle(
                    color: controller.text.isEmpty ? Colors.grey.shade500 : Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onFieldTapped?.call(); // Clear error if user taps the field
                    onTap(context); // Trigger the date picker on tap
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.grey.shade700,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class RequestDateField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorMessage;
  final Function(BuildContext context) onTap;
  final Function? onFieldTapped;
  final double width;// New callback to clear error
  final double height;

  const RequestDateField({
    Key? key,
    required this.controller,
    this.errorMessage,
    required this.onTap,
    this.onFieldTapped, required this.width, required this.height, // Add the new parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Error message
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4), // Adjust padding below error message
            child: Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 12), // Error text styling
            ),
          ),
        Container(
          width: width, // Adjust width for better layout
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  controller.text.isEmpty ? 'dd/mm/yyyy' : controller.text, // Display placeholder or entered date
                  style: TextStyle(
                    color: controller.text.isEmpty ? Colors.grey.shade500 : Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onFieldTapped?.call(); // Clear error if user taps the field
                    onTap(context); // Trigger the date picker on tap
                  },
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.grey.shade700,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorMessage;
  final Function(BuildContext context) onTap;
  final Function? onFieldTapped; // Callback to clear error

  const PhoneField({
    Key? key,
    required this.controller,
    this.errorMessage,
    required this.onTap,
    this.onFieldTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        // Error message
        if (errorMessage != null)
    Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        errorMessage!,
        style: const TextStyle(color: Colors.red, fontSize: 8),
      ),
    ),
    GestureDetector(
    onTap: () {
    onFieldTapped?.call(); // Clear error if user taps the field
    onTap(context); // Trigger the date picker on tap
    },
    child: Container(
    width: size.width * 0.223,
    height: size.height * 0.033,
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.grey.shade400, width: 1),
    borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
    padding: EdgeInsets.only(left: 4.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    controller.text.isEmpty ? 'dd/mm/yyyy' : controller.text,
    style: TextStyle(
    color: controller.text.isEmpty
    ? Colors.grey.shade500
        : Colors.black,
    fontFamily: 'Inter',
    fontSize: 10,
    ),
    ),
    Padding(
    padding: EdgeInsets.all(4.0),
    child: Icon(
    Icons.calendar_today,
    color: Colors.grey.shade700,
    size: 12,
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    ],
    );
    }
}



