import 'package:flutter/material.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/widget/movie_details/custom/custom_container.dart';

class IconsHeartStarClock extends StatelessWidget {
  const IconsHeartStarClock({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      spacing: w * 0.03,
      children: [
        CustomContainer(title: "15", icon: AppImages.heart),
        CustomContainer(title: "90", icon: AppImages.clock),
        CustomContainer(title: "4.5", icon: AppImages.star),
      ],
    );
  }
}
