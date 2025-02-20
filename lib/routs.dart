import 'package:flutter/material.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/screen/Tabs/BottomNavigationBarScreen.dart';
import 'package:movies/screen/Tabs/home.dart';
import 'package:movies/screen/forget_password_screen.dart';
import 'package:movies/screen/login_Screen.dart';
import 'package:movies/screen/movie_details.dart';
import 'package:movies/screen/register_screen.dart';

Map<String, Widget Function(BuildContext)> routs = {
  // "/": (context) => const OnBoarding(),
  AppRouts.home: (context) => const Home(),
  AppRouts.movieDetails: (context) => const MovieDetails(),
  AppRouts.login: (context) => const LoginScreen(),
  AppRouts.register: (context) => const RegisterScreen(),
  AppRouts.forgetPass: (context) => const ForgetPasswordScreen(),
//  AppRouts.bottonNavigator:
  '/': (context) => const BottomNavigationBarScreen(),
};
