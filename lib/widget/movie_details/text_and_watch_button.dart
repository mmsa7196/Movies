import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/customs/button.dart';

class TextAndWatchButton extends StatelessWidget {
  const TextAndWatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          "Doctor Strange in the Multiverse of Madness",
          style: textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
        Text(
          "2022",
          style: textTheme.bodyLarge!.copyWith(color: AppColors.textSecondary),
          textAlign: TextAlign.center,
        ),
        CustomButton(
          border: false,
          title: "Watch",
          textColor: AppColors.text,
          textStyle: textTheme.bodyLarge!,
          color: AppColors.buttonRed,
        )
      ],
    );
  }
}
