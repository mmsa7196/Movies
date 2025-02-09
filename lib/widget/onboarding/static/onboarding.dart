import 'package:flutter/material.dart';
import 'package:movies/core/class/app_colors.dart';
import 'package:movies/core/class/app_images.dart';

List<Map<String, dynamic>> onBoarding = [
  {
    "title": "Find Your Next \nFavorite Movie Here",
    "description":
        "Get access to a huge library of movies to suit all tastes. You will surely like it.",
    "image": AppImages.onboarding1,
    "colors": [
      AppColors.primary,
      const Color.fromARGB(142, 18, 19, 18),
      const Color.fromARGB(0, 255, 255, 255)
    ]
  },
  {
    "title": "Discover Movies",
    "description":
        "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    "image": AppImages.onboarding2,
    "colors": [
      AppColors.blueScreen,
      const Color.fromARGB(0, 8, 66, 80),
    ]
  },
  {
    "title": "Explore All Genres",
    "description":
        "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    "image": AppImages.onboarding3,
    "colors": [
      AppColors.redScreen,
      const Color.fromARGB(0, 133, 34, 14),
    ]
  },
  {
    "title": "Create Watchlists",
    "description":
        "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    "image": AppImages.onboarding4,
    "colors": [
      AppColors.moveScreen,
      const Color.fromARGB(0, 76, 36, 113),
    ]
  },
  {
    "title": "Rate, Review, and Learn",
    "description":
        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    "image": AppImages.onboarding5,
    "colors": [
      AppColors.redSecondScreen,
      const Color.fromARGB(0, 96, 19, 33),
    ]
  },
  {
    "title": "Start Watching Now",
    "description": "",
    "image": AppImages.onboarding6,
    "colors": [
      AppColors.greyScreen,
      const Color.fromARGB(0, 42, 44, 48),
    ]
  },
];
