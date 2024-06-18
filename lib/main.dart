import 'dart:io';

import 'package:dummy_template/Routes/tab_menu.dart';
import 'package:dummy_template/config/auth.dart';
import 'package:dummy_template/pages/alert/alert_page.dart';
import 'package:dummy_template/pages/home/widget/archive_board.dart';
import 'package:dummy_template/pages/home/widget/dashboard.dart';
import 'package:dummy_template/pages/home/widget/set_goal.dart';
import 'package:dummy_template/pages/login/login_page.dart';
import 'package:dummy_template/pages/login/widget/pin_code.dart';
import 'package:dummy_template/pages/login/widget/success_login.dart';
import 'package:dummy_template/pages/onboarding/onboarding_page.dart';
import 'package:dummy_template/pages/onboarding/setup_info.dart';
import 'package:dummy_template/pages/profile/profile_page.dart';
import 'package:dummy_template/pages/signup/signup_page.dart';
import 'package:dummy_template/pages/splash/splash_page.dart';
import 'package:dummy_template/values/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyBBrjrRufL84anhVNyK7EqbJed92nN3cKs',
              appId: '1:594435343057:android:1fd276a36487cca2fc7bf0',
              messagingSenderId: '594435343057',
              projectId: 'fir-auth-32b3a'))
      : await Firebase.initializeApp();
  runApp(const MyApp());
  FocusManager.instance.primaryFocus?.unfocus();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: MaterialColor(0xFF2196F3, <int, Color>{
            50: Colors.blue.shade50,
            100: Colors.blue.shade100,
            200: Colors.blue.shade200,
            300: Colors.blue.shade300,
            400: Colors.blue.shade400,
            500: Colors.blue.shade500,
            600: Colors.blue.shade600,
            700: Colors.blue.shade700,
            800: Colors.blue.shade800,
            900: Colors.blue.shade900,
          })),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: splashPage,
      routes: {
        tabMenu: (context) => const TabMenu(),
        loginPage: (context) => const LoginPage(),
        signupPage: (context) => const SignupPage(),
        splashPage: (context) => const SplashScreen(),
        setupInfo: (context) => const SetupInfo(),
        pinCode: (context) => const PinCode(),
        alertPage: (context) => const AlertPage(),
        onboardingPage: (context) => const OnboardingPage(),
        auth: (context) => const Auth(),
        successLogin: (context) => const SuccessLogin(),
        setGoal: (context) => const SetGoal(),
        dashBoard: (context) => const DashBoard(),
        archiveBoard: (context) => const ArchiveBoard(),
        profilePage: (context) => const ProfilePage(),
      },
    );
  }
}
