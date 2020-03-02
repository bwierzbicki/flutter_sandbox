import 'package:flutter/material.dart';

import '../models/search_result.dart';

class ResultItem extends StatelessWidget {
  final SearchResultItem item;

  ResultItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            child: Image.network(
              item.artworkUrl60,
              height: 40,
              width: 40,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.trackName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  item.artistName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.caption.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
