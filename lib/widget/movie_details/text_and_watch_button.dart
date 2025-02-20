import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/customs/button.dart';

class TextAndWatchButton extends StatelessWidget {
  final String title;
  final String year;
  const TextAndWatchButton(
      {super.key, required this.title, required this.year});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          title,
          style: textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          year,
          style: textTheme.bodyLarge!.copyWith(color: AppColors.textSecondary),
          textAlign: TextAlign.center,
        ),
        CustomButton(
          border: false,
          widget: Text("Watch"),
          textColor: AppColors.text,
          textStyle: textTheme.bodyLarge!,
          color: AppColors.buttonRed,
        )
      ],
    );
  }
}
