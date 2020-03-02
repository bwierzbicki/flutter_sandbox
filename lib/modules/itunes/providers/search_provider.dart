import 'package:flutter/foundation.dart';
import 'package:flutter_sandbox/modules/itunes/services/itunes_service.dart';

import '../models/search_result.dart';

class SearchProvider extends ChangeNotifier {
  ItunesService _itunesService = ItunesService();
  SearchResult __searchResult = SearchResult();

  SearchProvider() {
    __searchResult.resultCount = 0;
    __searchResult.results = new List<SearchResultItem>();
  }

  SearchResult get searchResult => __searchResult;

  set _searchResult(SearchResult value) {
    __searchResult = value;
    notifyListeners();
  }

  Future<bool> performSearch(String term) async {
    try {
      print(term);
      _searchResult = await _itunesService.searchByTerm(term);
      print(__searchResult.toJson());
    } catch (error) {
      return false;
    }
    return true;
  }
}
