import 'package:flutter/material.dart';
import 'package:movies/customs/movie_poster.dart';
import 'package:movies/widget/onboarding/static/onboarding_list.dart';

import '../../core/class/app_rout.dart';

class MoviesAvailableNow extends StatefulWidget {
  final double currentPage;
  final PageController pageController;
  const MoviesAvailableNow(
      {super.key, required this.pageController, required this.currentPage});

  @override
  State<MoviesAvailableNow> createState() => _MoviesAvailableNowState();
}

class _MoviesAvailableNowState extends State<MoviesAvailableNow> {
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: widget.pageController,
        itemCount: onBoarding.length,
        itemBuilder: (context, index) {
          double scale = (widget.currentPage - index).abs() <= 1
              ? 1 - (widget.currentPage - index).abs() * 0.3
              : 0.7;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                  scale: scale,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouts.movieDetails);
                    },
                    child: CustomMoviePoster(
                        image: onBoarding[index]["image"],
                        rating: '7.7',
                        height: 310,
                        width: double.infinity,
                        ratingHeight: 30,
                        ratingWidth: 50),
                  )),
            ],
          );
        },
      ),
    );
  }
}
