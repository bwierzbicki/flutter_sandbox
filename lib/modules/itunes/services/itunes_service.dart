import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/search_result.dart';

class ItunesService {
  String _baseUrl = 'http://itunes.apple.com/search?term=';

  Future<SearchResult> searchByTerm(String term) async {
    print(_baseUrl + term);
    var data = await http.get(_baseUrl + term);
    return SearchResult.fromJson(jsonDecode(data.body) as Map<String, dynamic>);
  }
}
