import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';

class AppBarDetails extends StatelessWidget {
  const AppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.text,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_outlined,
            color: AppColors.text,
            size: 30,
          ),
        ),
      ],
    );
  }
}

//la dolce villa
