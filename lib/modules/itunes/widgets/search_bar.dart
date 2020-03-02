import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchController = TextEditingController();

  SearchProvider _searchProvider;
  Timer _debounce;
  Future<bool> _searchHandler;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_searchOnType);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _searchOnType() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (_searchProvider != null) {
        _searchProvider.performSearch(_searchController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _searchProvider = Provider.of<SearchProvider>(context, listen: false);

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          autofocus: true,
          controller: _searchController,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            labelText: 'Search term',
          ),
        ),
      ),
    );
  }
}
