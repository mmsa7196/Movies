import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget? widget;
  final Color color;
  final Color textColor;
  final TextStyle textStyle;
  final bool border;
  const CustomButton(
      {super.key,
      this.border = true,
      required this.widget,
      this.color = AppColors.button,
      required this.textColor,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
            border:
                border ? Border.all(width: 1, color: AppColors.button) : null),
        child: widget);
  }
}
