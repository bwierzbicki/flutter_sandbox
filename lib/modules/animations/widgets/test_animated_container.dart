import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestAnimatedContainer extends StatefulWidget {
  @override
  _TestAnimatedContainerState createState() => _TestAnimatedContainerState();
}

class _TestAnimatedContainerState extends State<TestAnimatedContainer> {
  bool selected = false;

  Duration _duration = Duration(milliseconds: 2000);

  var _rng = new Random();

  static const List<Color> _colors = [
    Colors.indigo,
    Colors.teal,
    Colors.pink,
    Colors.deepOrange,
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.deepPurple,
    Colors.red,
    Colors.lightGreen,
    Colors.purple,
    Colors.white,
    Colors.grey,
    Colors.lime,
  ];

  @override
  Widget build(BuildContext context) {
    var margin = _rng.nextDouble() * 30;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: _rng.nextDouble() * 200 + 100,
          height: _rng.nextDouble() * 200 + 100,
          margin: EdgeInsets.all(margin),
          alignment:
              selected ? Alignment.topLeft : AlignmentDirectional.bottomEnd,
          duration: _duration,
          curve: Curves.fastOutSlowIn,
          child: FlutterLogo(size: _rng.nextDouble() * 70 + 30),
          padding: EdgeInsets.fromLTRB(
            _rng.nextDouble() * 30,
            _rng.nextDouble() * 30,
            _rng.nextDouble() * 30,
            _rng.nextDouble() * 30,
          ),
          foregroundDecoration: FlutterLogoDecoration(
            lightColor: _colors[_rng.nextInt(_colors.length)],
            darkColor: _colors[_rng.nextInt(_colors.length)],
            style: FlutterLogoStyle.horizontal,
            textColor: _colors[_rng.nextInt(_colors.length)],
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: _colors[_rng.nextInt(_colors.length)],
              style: BorderStyle.solid,
              width: margin,
            ),
            borderRadius: BorderRadius.all(Radius.circular(
              _rng.nextInt(40).toDouble(),
            )),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: _colors[_rng.nextInt(_colors.length)],
                blurRadius: margin,
                spreadRadius: 0,
              ),
            ],
          ),
          //{Color lightColor: const Color(0xFF42A5F5), Color darkColor: const Color(0xFF0D47A1), Color textColor: const Color(0xFF616161), FlutterLogoStyle style: FlutterLogoStyle.markOnly, EdgeInsets margin: EdgeInsets.zero}),
        ),
      ),
    );
  }
}
