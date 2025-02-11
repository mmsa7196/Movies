import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/customs/button.dart';
import 'package:movies/widget/movie_details/icon_play.dart';
import 'package:movies/widget/onboarding/screen_color.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            //   alignment: Alignment.center,
            children: [
              Image.asset(
                AppImages.onboarding5,
                height: h * 0.8,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              ScreenColor(height: h * 0.8, width: double.infinity, colors: [
                AppColors.primary,
                const Color.fromARGB(0, 18, 19, 18)
              ]),
              Column(
                spacing: h * 0.15,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
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
                  ),
                  const IconPlay(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Text(
                          "Doctor Strange in the Multiverse of Madness",
                          style: textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "2022",
                          style: textTheme.bodyLarge!
                              .copyWith(color: AppColors.textSecondary),
                          textAlign: TextAlign.center,
                        ),
                        CustomButton(
                          title: "Watch",
                          textColor: AppColors.text,
                          textStyle: textTheme.bodyLarge!,
                          color: AppColors.buttonRed,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
