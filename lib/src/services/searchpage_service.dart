import 'package:dio/dio.dart';
import '../models/search_page_models/search_model.dart';

final Dio _dio2 = Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/search/movie",
));
Future<SearchModel?> getSearchListService(String query) async {
  SearchModel searchlist = SearchModel();

// https://api.themoviedb.org/3/search/movie?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US&query=10&page=1&include_adult=true

  try {
    final response = await _dio2.get(
        "?api_key=1b258cebbacdf3b382888ffa108d4084&language=en-US&query=$query&page=1&include_adult=true");
    searchlist = SearchModel.fromJson(response.data);
    /* print(response.data);
    // Çalışıp çalışmadığını kontrol ediliyor
    if (response.statusCode == 200) {
      print("Search page çalışıyor");
    } else {
      print("Search page çalışmıyor.");
    } */
    return searchlist;
  } catch (e) {
    // print(e);
  }

  return null;
}
