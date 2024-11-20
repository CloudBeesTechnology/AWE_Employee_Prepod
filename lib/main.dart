import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:awe_project/Screens/dashboard_screen.dart';
import 'package:awe_project/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Amplify and GetStorage
  await _configureAmplify();
  await GetStorage.init();

  // Check if user is already logged in before launching the app
  bool isLoggedIn = await _checkUserSession();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<void> _configureAmplify() async {
  try {
    // Add Amplify plugins
    final authPlugin = AmplifyAuthCognito();
    final storagePlugin = AmplifyStorageS3();
    final apiPlugin = AmplifyAPI(
      options: APIPluginOptions(modelProvider: ModelProvider.instance),
    );

    await Amplify.addPlugins([authPlugin, storagePlugin, apiPlugin]);
    await Amplify.configure(amplifyconfig);
    print('Successfully configured Amplify');
  } catch (e) {
    print('Could not configure Amplify: $e');
  }
}

Future<bool> _checkUserSession() async {
  try {
    // Fetch session status
    var session = await Amplify.Auth.fetchAuthSession();

    // Return true only if the session is signed in
    return session.isSignedIn;
  } catch (e) {
    print('Error fetching session: $e');
    return false;  // Fallback to not signed in
  }
}

// MyApp Class
class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Navigate to either Dashboard or Login depending on session state
      home: isLoggedIn ? DashBoardScreeen() : LoginScreen(),
    );
  }
}
