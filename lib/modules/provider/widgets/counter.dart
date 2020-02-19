import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter.dart' as provider;

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _headerStyle = TextStyle(fontSize: 60);
  var _rng = new Random();
  var _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.yellow
  ];

  var _bgColors = [
    Colors.lightGreen,
    Colors.lightBlueAccent,
    Colors.cyan,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bgColors[_rng.nextInt(_bgColors.length)],
      child: Column(
        children: <Widget>[
          Text(
            'Consumer',
            style: _headerStyle,
          ),
          Consumer<provider.Counter>(
            builder: (_, counter, __) {
              return Column(
                children: <Widget>[
                  Text(
                    counter.count.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      color: _colors[_rng.nextInt(_colors.length)],
                    ),
                  ),
                  Text(
                    counter.count2.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      color: _colors[_rng.nextInt(_colors.length)],
                    ),
                  ),
                ],
              );
            },
          ),
          Column(
            children: <Widget>[
              Text(
                'Selector',
                style: _headerStyle,
              ),
              Selector<provider.Counter, int>(
                selector: (_, countProvider) => countProvider.count,
                builder: (_, data, __) {
                  return Text(
                    data.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      color: _colors[_rng.nextInt(_colors.length)],
                    ),
                  );
                },
              ),
              Selector<provider.Counter, String>(
                selector: (_, countProvider) =>
                    countProvider.count2 > 5 ? 'więcej niż 5' : 'mniej niż 5',
                builder: (_, data, __) {
                  return Text(
                    data,
                    style: TextStyle(
                      fontSize: 50,
                      color: _colors[_rng.nextInt(_colors.length)],
                    ),
                  );
                },
              ),
            ],
          ),
          Text('Tło całości zmienia się na 15 w counter 1, a to zostaje'),
        ],
      ),
    );
  }
}
