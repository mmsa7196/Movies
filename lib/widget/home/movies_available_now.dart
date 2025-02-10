import 'package:flutter/material.dart';
import 'package:movies/customs/movie_poster.dart';
import 'package:movies/widget/onboarding/static/onboarding_list.dart';

class MoviesAvailableNow extends StatefulWidget {
  const MoviesAvailableNow({super.key});

  @override
  State<MoviesAvailableNow> createState() => _MoviesAvailableNowState();
}

class _MoviesAvailableNowState extends State<MoviesAvailableNow> {
  @override
  double _currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.55);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: _pageController,
        itemCount: onBoarding.length,
        itemBuilder: (context, index) {
          double scale = (_currentPage - index).abs() <= 1
              ? 1 - (_currentPage - index).abs() * 0.3
              : 0.7;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                  scale: scale,
                  child: CustomMoviePoster(
                      image: onBoarding[index]["image"],
                      rating: '7.7',
                      height: 310,
                      width: double.infinity,
                      ratingHeight: 30,
                      ratingWidth: 50)),
            ],
          );
        },
      ),
    );
  }
}
