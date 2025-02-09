import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.button,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: textStyle.bodyLarge!.copyWith(color: AppColors.primary),
      ),
    );
  }
}
