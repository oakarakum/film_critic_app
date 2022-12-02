// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

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
    print(response.data);
    if (response.statusCode == 200) {
      print("Çalışıyor");
    } else {
      print("Çalışmıyor");
    }
    return searchlist;
  } catch (e) {
    print(e);
  }

  return null;
}
