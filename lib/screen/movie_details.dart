import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';
import 'package:movies/widget/movie_details/app_bar.dart';
import 'package:movies/widget/movie_details/cast_movie.dart';
import 'package:movies/widget/movie_details/custom_gener.dart';
import 'package:movies/widget/movie_details/icon_play.dart';
import 'package:movies/widget/movie_details/icons_heart_star_clock.dart';
import 'package:movies/widget/movie_details/similar_movies.dart';
import 'package:movies/widget/movie_details/summary_movie.dart';
import 'package:movies/widget/movie_details/text_and_watch_button.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: h * 0.15,
                  children: [
                    const AppBarDetails(),
                    const IconPlay(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: h * 0.02,
                        children: [
                          const TextAndWatchButton(),
                          const IconsHeartStarClock(),
                          Text("Screen Shots", style: textTheme.titleMedium),
                          Image.asset(AppImages.shortScreen),
                          Image.asset(AppImages.shortScreen),
                          Image.asset(AppImages.shortScreen),
                          Text("Similar", style: textTheme.titleMedium),
                          SimilarMovies(),
                          Text("Summary", style: textTheme.titleMedium),
                          SummaryMovie(),
                          Text("Cast", style: textTheme.titleMedium),
                          CastMovie(),
                          CastMovie(),
                          CastMovie(),
                          CastMovie(),
                          Text("Genre", style: textTheme.titleMedium),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children:
                                List.generate(5, (index) => CustomGenre()),
                          )
                        ])
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
