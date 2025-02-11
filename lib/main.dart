import 'package:flutter/material.dart';
import 'package:movies/core/static/app_theme.dart';
import 'package:movies/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Home(),
      //  routes: routs,
    );
  }
}
