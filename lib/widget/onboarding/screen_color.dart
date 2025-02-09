import 'package:flutter/material.dart';

class ScreenColor extends StatelessWidget {
  final List<Color> colors;
  const ScreenColor({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: colors)),
    );
  }
}
