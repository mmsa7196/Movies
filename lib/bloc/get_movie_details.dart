import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies/bloc/states/details_movie.dart';
import 'package:movies/model/movie_details_model.dart';

class GetMovieDetails extends Cubit<DetailsMovieStates> {
  MovieDetailsModel model;

  GetMovieDetails({required this.model}) : super(DetailsMovieStatesIni());

  void getMovieDetails(String id) async {
    try {
      emit(DetailsMovieLoadingState());
      Uri url = Uri.parse(
          "https://yts.mx/api/v2/movie_details.json?movie_id=$id&with_cast=true&with_images=true");

      http.Response res = await http.get(url);

      if (res.statusCode == 200 || res.statusCode == 201) {
        final json = jsonDecode(res.body);
        model = MovieDetailsModel.fromJson(json);
        if (model.status == "ok" && model.data?.movie != null) {
          emit(DetailsMovieSuccessState());
        } else {
          emit(DetailsMovieErrorState(
              error: model.statusMessage ?? "Unknown error"));
        }
      } else {
        emit(DetailsMovieErrorState(error: "Failed to load movie details"));
      }
    } catch (e) {
      emit(DetailsMovieErrorState(error: e.toString()));
    }
  }
}
