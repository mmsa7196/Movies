import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies/bloc/bloc_home_states.dart';
import 'package:movies/model/movies_model.dart';

class HomeGetMovies extends Cubit<HomeStates> {
  List<Movies>? moviesAll;
  HomeGetMovies() : super(HomeInitState());

  void getMovies() async {
    print("/////////////////////////////////");
    try {
      emit(HomeGetLoadingState());
      Uri url = Uri.parse("https://yts.mx/api/v2/list_movies.json");
      final http.Response res = await http.get(url);

      if (res.statusCode == 200) {
        print("--------------------------------------getAll");
        var resBody = jsonDecode(res.body);
        MoviesModel moviesModel = MoviesModel.fromJson(resBody);
        moviesAll = moviesModel.data?.movies ?? [];
        emit(HomeGetSuccessState());
      } else {
        emit(HomeGetErrorState());
      }
    } catch (e) {
      print("---------------------------------$e");
      emit(HomeGetErrorState());
    }
  }
}
