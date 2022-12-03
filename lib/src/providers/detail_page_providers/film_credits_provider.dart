// ignore_for_file: non_constant_identifier_names

import 'package:film_critic_app/src/models/detail_page_models/film_credits_model.dart';
import 'package:flutter/cupertino.dart';

import '../../services/detailpage_services.dart';

class FilmCreditsProvider with ChangeNotifier {
  FilmCreditsModel castList = FilmCreditsModel();
  bool isCastListLoaded = false;
  int movie_id2 = 436270;

  getCrew() async {
    isCastListLoaded = false;
    castList = (await getFilmCrewService(movie_id2))!;
    isCastListLoaded = true;
    notifyListeners();
  }

  getChange(int change) {
    movie_id2 = change;
    getCrew();
    notifyListeners();
  }
}
