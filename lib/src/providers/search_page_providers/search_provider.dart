import 'package:film_critic_app/src/services/searchpage_service.dart';
import 'package:flutter/material.dart';
import '../../models/search_page_models/search_model.dart';

class SearchProvider extends ChangeNotifier {
  SearchModel? searchlist = SearchModel();
  String query = "Baba";
  bool isSearchLoaded = false;

  getSearchData() async {
    isSearchLoaded = false;
    searchlist = (await getSearchListService(query));
    isSearchLoaded = true;
    notifyListeners();
  }

  getQuery(String query3) {
    query = query3;
    getSearchData();
    notifyListeners();
  }
}
