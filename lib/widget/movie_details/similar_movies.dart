import 'package:flutter/material.dart';
import 'package:movies/customs/movie_poster.dart';
import 'package:movies/widget/onboarding/static/onboarding_list.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 650,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomMoviePoster(
                image: onBoarding[index]['image'],
                rating: '9.0',
                height: h * 0.35,
                width: w * 0.45,
                ratingHeight: 30,
                ratingWidth: 60)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
      ),
    );
  }
}
