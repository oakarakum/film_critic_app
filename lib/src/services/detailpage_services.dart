// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:film_critic_app/src/models/detail_page_models/film_credits_model.dart';
import '../models/detail_page_models/picked_films_models.dart';

final Dio _dio = Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/movie/",
));
//
Future<DetailPickedFilmsModel?> getDetailedFilmsService(int movie_id) async {
  DetailPickedFilmsModel pickedlist = DetailPickedFilmsModel();

// https://api.themoviedb.org/3/movie/436270?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US

  try {
    final response = await _dio.get(
        "$movie_id?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US");

    pickedlist = DetailPickedFilmsModel.fromJson(response.data);
    print(response.data);
    return pickedlist;
    /* Çalışıp çalışmadığını kontrol ediliyor
     if (response.statusCode == 200) {
      print("Çalışıyor");
    } else {
      print("Çalışmıyor");
    } */
  } catch (e) {
    // print(e);
  }

  return null;
}

Future<FilmCreditsModel?> getFilmCrewService(int movie_id2) async {
  FilmCreditsModel crewList = FilmCreditsModel();

// https://api.themoviedb.org/3/movie/238/credits?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US

  try {
    final response = await _dio.get(
        "$movie_id2/credits?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US");

    crewList = FilmCreditsModel.fromJson(response.data);
    print(response.data);
    // Çalışıp çalışmadığını kontrol ediliyor
     if (response.statusCode == 200) {
      print("Çalışıyor");
    } else {
      print("Çalışmıyor");
    } 
        return crewList;

  } catch (e) {
    // print(e);
  }

  return null;
}
