import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/customs/movie_poster.dart';
import 'package:movies/customs/title_list.dart';
import 'package:movies/widget/home/back_ground_screen.dart';
import 'package:movies/widget/home/movies_available_now.dart';
import 'package:movies/widget/onboarding/screen_color.dart';
import 'package:movies/widget/onboarding/static/onboarding_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(alignment: Alignment.topCenter, children: [
        BackGroundScreen(),
        ScreenColor(
            colors: [AppColors.primary, const Color.fromARGB(119, 40, 47, 40)]),
        ListView(
          children: [
            Positioned(top: 10, child: Image.asset(AppImages.availableNow)),
            MoviesAvailableNow(),
            Positioned(
                top: 10,
                child: Image.asset(
                  AppImages.watchNow,
                )),
            CustomTitleList(title: "Action", subTitle: "see more"),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: onBoarding.length,
                    itemBuilder: (context, index) => CustomMoviePoster(
                        image: onBoarding[index]["image"],
                        rating: '7.7',
                        height: 250,
                        width: 150,
                        ratingHeight: 30,
                        ratingWidth: 50)),
              ),
            )
          ],
        )
      ]),
    ));
  }
}
