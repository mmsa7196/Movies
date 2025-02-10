import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';

class CustomMoviePoster extends StatelessWidget {
  final String image;
  final String rating;
  final double height;
  final double width;
  final double ratingHeight;
  final double ratingWidth;

  const CustomMoviePoster(
      {super.key,
      required this.image,
      required this.rating,
      required this.height,
      required this.width,
      required this.ratingHeight,
      required this.ratingWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                height: height,
                fit: BoxFit.cover,
                width: width,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                alignment: Alignment.center,
                height: ratingHeight,
                width: ratingWidth,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(rating),
                    const Icon(
                      Icons.star,
                      color: AppColors.button,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
