import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter.dart';

class PlusMinus extends StatelessWidget {
  final _textStyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context, listen: false);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                onPressed: () => counter.decrement(),
                child: Text(
                  'MINUS',
                  style: _textStyle,
                ),
                color: Theme.of(context).errorColor,
              ),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () => counter.increment(),
                child: Text('PLUS', style: _textStyle),
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                onPressed: () => counter.decrement2(),
                child: Text(
                  'MINUS2',
                  style: _textStyle,
                ),
                color: Theme.of(context).errorColor,
              ),
            ),
            Expanded(
              child: RaisedButton(
                onPressed: () => counter.increment2(),
                child: Text('PLUS2', style: _textStyle),
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
