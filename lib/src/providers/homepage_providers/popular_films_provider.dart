import 'package:film_critic_app/src/models/homepage_models/popular_films_model.dart';
import 'package:film_critic_app/src/services/homepage_services.dart';
import 'package:flutter/cupertino.dart';

class PopularFilmsProvider with ChangeNotifier {
  //int pageIndex = 0;
  PopularFilmsModel? popularfilms = PopularFilmsModel();
  bool isPopularFilmsLoaded = false;

  getPopularFilms() async {
    isPopularFilmsLoaded = false;
    popularfilms = await getPopularFilmsServices();
    isPopularFilmsLoaded = true;
    notifyListeners();
  }

  /* PageSwitcher() async {
    switch (pageIndex = index) {
      case 0:
      return 
        break;
      default:
    }
  } */
}
