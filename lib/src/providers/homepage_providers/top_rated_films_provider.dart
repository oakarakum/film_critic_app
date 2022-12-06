import 'package:film_critic_app/src/models/homepage_models/top_rated_films_model.dart';
import 'package:film_critic_app/src/services/homepage_services.dart';
import 'package:flutter/cupertino.dart';

class TopRatedFilmsProvider extends ChangeNotifier {
  TopRatedFilmModel topfilms = TopRatedFilmModel();
  bool isAlbumTracksLoaded = false;

  getTopRatedFilms() async {
    isAlbumTracksLoaded = false;
    topfilms = (await getTopRatedFilmsService())!;
    isAlbumTracksLoaded = true;
    notifyListeners();
  }
}
