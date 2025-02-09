import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/widget/onboarding/customs/button.dart';

class TextAndButton extends StatelessWidget {
  final String title;
  final String description;
  final String titleButton;
  final String secondTItleButton;
  final int i;
  const TextAndButton(
      {super.key,
      required this.title,
      required this.description,
      this.i = 0,
      this.titleButton = "Next",
      this.secondTItleButton = "Back"});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment.bottomCenter,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: textStyle.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 350,
            child: Text(
              description,
              style: textStyle.bodyMedium!
                  .copyWith(color: AppColors.text.withOpacity(0.5)),
              textAlign: TextAlign.center,
            ),
          ),
          CustomButton(title: titleButton),
          i <= 2 ? CustomButton(title: secondTItleButton) : SizedBox()
        ],
      ),
    );
  }
}
