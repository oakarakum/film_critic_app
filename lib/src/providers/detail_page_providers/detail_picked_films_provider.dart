import 'package:flutter/material.dart';

import '../../models/detail_page_models/picked_films_models.dart';
import '../../services/detailpage_services.dart';

class DetailPickedFilmsProvider extends ChangeNotifier {
  DetailPickedFilmsModel pickedfilms2 = DetailPickedFilmsModel();
  bool isPickedFilmLoaded = false;
  int movie_id = 436270;

  getDetailedPickedFilms() async {
    isPickedFilmLoaded = false;
    pickedfilms2 = (await getDetailedFilmsService(movie_id))!;
    isPickedFilmLoaded = true;
    notifyListeners();
  }

  getChange(int change) {
    movie_id = change;
    getDetailedPickedFilms();
    notifyListeners();
  }
}
