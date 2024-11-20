import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:awe_project/Components/helper_class.dart';
import 'package:awe_project/Screens/dashboard_screen.dart';
import 'package:awe_project/globals/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Components/my_textfield.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  final box = GetStorage();

  void storeUserData(String userId) {
    final box = GetStorage();
    box.write('userId', userId);
  }

  String? getUserData() {
    final box = GetStorage();
    return box.read('userId');
  }

  Future<void> _signIn(BuildContext context) async {
    try {
      var session = await Amplify.Auth.fetchAuthSession();
      print('Current session: $session');

      if (session.isSignedIn) {
        String userId = await Amplify.Auth.getCurrentUser().then((user) => user.userId);
        print('User already signed in: $userId');
        Get.off(() => DashBoardScreeen());
        return;
      }

      SignInResult res = await Amplify.Auth.signIn(
        username: userIdController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (res.isSignedIn) {
        String empId = userIdController.text.trim(); // Use the value from userIdController
        print(empId);
        storeUserData(empId); // Store user ID locally
        print('Sign in successful for user: $empId');
        Get.off(() => DashBoardScreeen());


      } else {
        print('${res.isSignedIn}');
        _showErrorDialog(context, 'Verify email before login');
      }
    } on AuthException catch (e) {
      print('Authentication error: ${e.message}');
      _showErrorDialog(context, e.message);
    } catch (e) {
      print('Unexpected error: $e');
      _showErrorDialog(context, '${e}');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ok'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      //DESKTOP VIEW
      desktop: Scaffold(
        backgroundColor: bgColor,
        body:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
               Align(
                 alignment: Alignment.topLeft,
                 child: SizedBox(
                   width: 250,
                     height: 260,
                     child: Image.asset('assets/images/curve.png')),
               )
              ],
            ),
            SizedBox(width: size.width * 0.01,),
            Column(
              children: [
                SizedBox(height: size.height * 0.20,),
                SizedBox(
                  width: size.width * 0.240,
                  height: size.height * 0.090,
                  child: Image.asset('assets/images/awe logo.png'),
                ),
                SizedBox(height: size.height * 0.040,),
                Container(
                  height: size.height * 0.490,
                  width: size.width * 0.270,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.png'),
                    )
                  ),
                )
              ],
            ),
            SizedBox(width: size.width * 0.13,),
            Card(
              elevation: 2,
              shadowColor: Colors.white,
              child: Container(
                width: size.width * 0.280,
                height:size.height *  0.670,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: size.height * 0.12,),
                      child: Text("Welcome !",style: TextStyle(fontSize: 32,fontFamily: 'Inter',decoration: TextDecoration.none,color: black),),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right:size.width * 0.190,top: size.height * 0.02,bottom: size.height * 0.002),
                      child: Text('User Id',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ),
                    MyTextField(controller: userIdController, text: 'User ID', icon: Icons.person_outline, obscureText: false,),
                    SizedBox(height: size.height * 0.02,),
                    Padding(
                      padding:  EdgeInsets.only(right: size.width * 0.180,top: size.height * 0.01,bottom: size.height * 0.005),
                      child: Text('Password',style: TextStyle(fontFamily: 'Inter',fontSize: 16,color: black),),
                    ),
                    PasswordTextField(controller: passwordController, width:size.width *  0.235,height:  size.height * 0.050,),
                    SizedBox(height: size.height * 0.075,),
                    MaterialButton(
                      onPressed: _isLoading
                          ? null // Disable the button while loading
                          : () async {
                        setState(() {
                          _isLoading = true; // Start loading
                        });
                        await _signIn(context);
                        setState(() {
                          _isLoading = false; // Stop loading
                        });
                      },
                      minWidth: size.width * 0.228,
                      height: size.height * 0.060,
                      color: yellow,
                      splashColor: yellow,
                      child: _isLoading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(yellow), // Set spinner color to yellow
                      )
                          : Text(
                        "Login",
                        style: TextStyle(
                          color: black,
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),


        //TAB VIEW
        tablet: Scaffold(
          backgroundColor: bgColor,
          body:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: 145,
                        height: 150,
                        child: Image.asset('assets/images/curve.png')),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(height: size.height * 0.21,),
                  SizedBox(
                    width: size.width * 0.2,
                    height: size.height * 0.14,
                    child: Image.asset('assets/images/awe logo.png'),
                  ),
                  SizedBox(height: size.height * 0.03,),
                  Container(
                    height: size.height * 0.38,
                    width: size.width * 0.32,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login.png'),
                        )
                    ),
                  )
                ],
              ),
              SizedBox(width: size.width * 0.08,),
              Card(
                elevation: 2,
                shadowColor: Colors.white,
                child: Container(
                  width: size.width * 0.34,
                  height: size.height * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: size.height * 0.080),
                        child: Text("Login",style: TextStyle(fontSize: 22,fontFamily: 'Inter',decoration: TextDecoration.none,color: black),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width * 0.190,top: size.height * 0.020,bottom: size.height * 0.004),
                        child: Text('User Id',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                      ),
                      TabTextField(controller2: userIdController, text2: 'User ID', icon2: Icons.person_outline),
                      SizedBox(height: size.height * 0.02,),
                      Padding(
                        padding:  EdgeInsets.only(right: size.width * 0.170,top: size.height * 0.017,bottom: size.height * 0.002),
                        child: Text('Password',style: TextStyle(fontFamily: 'Inter',fontSize: 15,color: black),),
                      ),
                      PasswordTextField(controller: passwordController, width:size.width * 0.26,
                          height: size.height * 0.04,),
                      SizedBox(height: size.height * 0.05,),
                      MaterialButton(
                        onPressed: _isLoading
                            ? null // Disable the button while loading
                            : () async {
                          setState(() {
                            _isLoading = true; // Start loading
                          });
                          await _signIn(context);
                          setState(() {
                            _isLoading = false; // Stop loading
                          });
                        },
                        minWidth: size.width * 0.26,
                        height: size.height * 0.055,
                        color: yellow,
                        splashColor: yellow,
                        child: _isLoading
                            ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(yellow), // Set spinner color to yellow
                        )
                            : Text(
                          "Login",
                          style: TextStyle(
                            color: black,
                            fontFamily: 'Open Sans',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

        //MOBILE VIEW
        mobile: SafeArea(
            child: Container(
                color: bgColor,
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.520,
                      height: size.height * 0.15,
                      child: Image.asset(
                        'assets/images/awe logo.png',
                      ),
                    ),
                    Container(
                      width: size.width * 0.500,
                      height: size.height * 0.240,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/login.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: size.height * 0.039,
                    ),
                    Card(
                      elevation: 4,
                      shadowColor: Colors.white,
                      child: Container(
                        width: size.width * 0.75,
                        height: size.height * 0.43,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.040),
                              child: Text(
                                "Welcome !",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Inter',
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.450,
                                  top: 8,
                                  bottom: size.height * 0.002),
                              child: Text(
                                'User Id',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    color: black),
                              ),
                            ),
                            MobileTextField(
                                controller3: userIdController,
                                text3: 'User ID',
                                icon3: Icons.person_outline),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.400,
                                  top: size.height * 0.008,
                                  bottom: size.height * 0.002),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    color: black),
                              ),
                            ),
                            PasswordTextField(
                              controller: passwordController,
                              width: size.width * 0.57,
                              height: size.height * 0.045,
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            MaterialButton(
                              onPressed: _isLoading
                                  ? null // Disable the button while loading
                                  : () async {
                                setState(() {
                                  _isLoading = true; // Start loading
                                });
                                await _signIn(context);
                                setState(() {
                                  _isLoading = false; // Stop loading
                                });
                              },
                              minWidth: size.width * 0.30,
                              height: size.height * 0.048,
                              color: yellow,
                              splashColor: yellow,
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    yellow), // Set spinner color to yellow
                              )
                                  : Text(
                                "Login",
                                style: TextStyle(
                                  color: black,
                                  fontFamily: 'Open Sans',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                  )
        ),
        paddingWidth: size.width * 0.1,
        bgColor: bgColor);
  }
}


