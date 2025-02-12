import 'package:flutter/material.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/screen/home.dart';
import 'package:movies/screen/login_Screen.dart';
import 'package:movies/screen/movie_details.dart';
import 'package:movies/screen/register_screen.dart';

Map<String, Widget Function(BuildContext)> routs = {
  // "/": (context) => const OnBoarding(),
  AppRouts.log: (context) => const LoginScreen(),
  AppRouts.home: (context) => const Home(),
  // AppRouts.movieDetails:
  "/": (context) => const MovieDetails(),
};
