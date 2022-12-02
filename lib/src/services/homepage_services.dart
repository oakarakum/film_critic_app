// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../models/popular_films_model.dart';
import '../models/top_rated_films_model.dart';

final Dio _dio = Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/movie/",
));

Future<TopRatedFilmModel?> getTopRatedFilmsService() async {
  TopRatedFilmModel searchlist = TopRatedFilmModel();

  try {
    final response = await _dio.get(
        // tamamı:"top_rated?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US&page=1"
        "top_rated",
        queryParameters: {
          "api_key": "1b258cebbacdf3b382888ffa108d4084",
          "language": "en-US",
          "page": 1
        });

    searchlist = TopRatedFilmModel.fromJson(response.data);
    //print(response.data);
    return searchlist;
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

Future<PopularFilmsModel?> getPopularFilmsServices() async {
  PopularFilmsModel popularfilmlist = PopularFilmsModel();

  try {
    final response = await _dio.get(
        //https://api.themoviedb.org/3/movie/popular?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US&page=1
        "popular",
        queryParameters: {
          "api_key": "1b258cebbacdf3b382888ffa108d4084",
          "language": "en-US",
          "page": 1
        });
    popularfilmlist = PopularFilmsModel.fromJson(response.data);
    print(response.data);
    if (response.statusCode == 200) {
      print("Popular Çalışıyor");
    } else {
      print("Çalışmıyor");
    }
    return popularfilmlist;
  } catch (e) {
    print(e);
  }
  return null;
}
