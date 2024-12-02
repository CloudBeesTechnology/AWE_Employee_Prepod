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


