import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';

class CustomGenre extends StatelessWidget {
  const CustomGenre({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: Alignment.center,
      // height: 40,
      width: 110,
      decoration: BoxDecoration(
          color: AppColors.secondary, borderRadius: BorderRadius.circular(10)),
      child: Text(
        "Horror",
        style: textTheme.bodyMedium,
      ),
    );
  }
}
