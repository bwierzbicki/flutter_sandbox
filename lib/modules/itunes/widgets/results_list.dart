import 'package:flutter/material.dart';
import 'package:flutter_sandbox/modules/itunes/providers/player_provider.dart';
import 'package:provider/provider.dart';

import './result_item.dart';
import '../models/search_result.dart';
import '../providers/search_provider.dart';

class ResultsList extends StatefulWidget {
  @override
  _ResultsListState createState() => _ResultsListState();
}

class _ResultsListState extends State<ResultsList> {
  @override
  Widget build(BuildContext context) {
    var playerProvider = Provider.of<PlayerProvider>(context, listen: false);

    return Selector<SearchProvider, SearchResult>(
      selector: (_, searchProvider) => searchProvider.searchResult,
      builder: (_, searchResult, __) {
        return ListView.builder(
          itemCount: searchResult.resultCount,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              playerProvider.songUrl = searchResult.results[index].previewUrl;
              playerProvider.imageUrl =
                  searchResult.results[index].artworkUrl100;
            },
            child: ResultItem(searchResult.results[index]),
          ),
        );
      },
    );
  }
}
