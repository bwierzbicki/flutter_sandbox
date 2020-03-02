import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/search_result.dart';
import '../providers/player_provider.dart';
import '../providers/search_provider.dart';
import '../services/itunes_service.dart';
import '../widgets/player.dart';
import '../widgets/results_list.dart';
import '../widgets/search_bar.dart';

class ItunesScreen extends StatefulWidget {
  static String routeName = '/itunes';

  @override
  _ItunesScreenState createState() => _ItunesScreenState();
}

class _ItunesScreenState extends State<ItunesScreen> {
  Future<SearchResult> _searchResultsData;

  ItunesService itunesService = ItunesService();

  @override
  void initState() {
    super.initState();
    _searchResultsData = itunesService.searchByTerm('a');
  }

  @override
  Widget build(BuildContext context) {
    //var searchProvider = Provider.of<SearchProvider>(context, listen: false);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
        ChangeNotifierProvider<PlayerProvider>(create: (_) => PlayerProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('iTunes'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SearchBar(),
              Expanded(
                child: ResultsList(),
              ),
              Player(),
            ],
          ),
        ),
      ),
    );
  }
}
