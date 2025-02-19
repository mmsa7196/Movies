import 'package:flutter/material.dart';
import 'package:movies/core/static/app_theme.dart';
import 'package:movies/routs.dart';

void main() {
  // configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: routs,
    );
  }
}
