import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/static/app_theme.dart';
import 'package:movies/firebase_options.dart';
import 'package:movies/routs.dart';
import 'package:movies/screen/OnBoarding.dart';
import 'package:movies/screen/forget_password_screen.dart';
import 'package:movies/screen/home.dart';
import 'package:movies/screen/login_Screen.dart';
import 'package:movies/screen/register_screen.dart';
import 'package:movies/widget/onboarding/static/onboarding_list.dart';
import 'package:movies/screen/Tabs/BottomNavigationBarScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: BottomNavigationBarScreen(),
      //  routes: routs,
    );
  }
}
