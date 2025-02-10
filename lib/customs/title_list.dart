import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';

class CustomTitleList extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomTitleList(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(
            spacing: 6,
            children: [
              Text(
                subTitle,
                style: TextStyle(color: AppColors.button),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.button,
                size: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
