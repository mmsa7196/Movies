import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/get_explore.dart';
import 'package:movies/bloc/states/explor_states.dart';
import 'package:movies/core/class/app_rout.dart';
import 'package:movies/core/const/genre_list.dart';
import 'package:movies/customs/movie_poster.dart';
import 'package:movies/widget/explore/list_choose.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  int _currentIndex = 0;
  late GetExplore getExploreBloc;

  @override
  void initState() {
    super.initState();
    getExploreBloc = GetExplore()..getExplore(genre[_currentIndex]);
  }

  void _onSelected(int i) {
    if (_currentIndex != i) {
      setState(() {
        _currentIndex = i;
        getExploreBloc.getExplore(genre[_currentIndex]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: BlocProvider.value(
        value: getExploreBloc,
        child: Column(
          children: [
            ListChoose(
              onSelected: _onSelected,
              selected: _currentIndex,
            ),
            const SizedBox(height: 20),
            BlocConsumer<GetExplore, ExploreState>(
              listener: (context, state) {
                if (state is ExploreErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("error_loading_movie_details".tr())),
                  );
                }
              },
              builder: (context, state) {
                if (state is ExploreLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ExploreErrorState) {
                  return Center(child: Text("error_loading_movies".tr()));
                }
                if (state is ExploreSuccessState) {
                  var movies = getExploreBloc.movies;
                  if (movies.isEmpty) {
                    return Center(child: Text("no_movies_available".tr()));
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: movies.length > 30 ? 30 : movies.length,
                          itemBuilder: (context, index) => CustomMoviePoster(
                            ontap: () {
                              Navigator.of(context).pushNamed(
                                AppRouts.movieDetails,
                                arguments: movies[index],
                              );
                            },
                            image: movies[index].mediumCoverImage!,
                            rating: movies[index].rating.toString(),
                            height: h * 0.35,
                            width: w * 0.45,
                            ratingHeight: 35,
                            ratingWidth: 70,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      //   width: w,
                      //   child: CustomButton(
                      //     widget: Row(
                      //       children: [
                      //         Text("More"),
                      //         Icon(Icons.arrow_drop_down_rounded)
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  );
                }
                return Center(child: Text("no_movie_details_available".tr()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
