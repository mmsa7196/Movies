import 'package:flutter/material.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/screen/home.dart';
import 'package:movies/screen/logIn_Screen.dart';
import 'package:movies/screen/movie_details.dart';

Map<String, Widget Function(BuildContext)> routs = {
  // "/": (context) => const OnBoarding(),
  AppRouts.log: (context) => LoginScreen(),
  AppRouts.home: (context) => const Home(),
  AppRouts.home: (context) =>  Home(),
  AppRouts.log: (context) => const LoginScreen(),
  // AppRouts.movieDetails:
  "/": (context) => const MovieDetails(),
};
