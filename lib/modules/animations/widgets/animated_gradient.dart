import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedGradient extends StatefulWidget {
  _AnimatedGradient createState() => _AnimatedGradient();
}

class _AnimatedGradient extends State<AnimatedGradient>
    with SingleTickerProviderStateMixin {
  List<Color> _colors = List<Color>.generate(4, (index) {
    switch (index % 4) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.red;
      default:
        return Colors.deepPurple;
    }
  });
  List<double> _stops = List<double>.generate(4, (index) => index * 0.4 - 0.24);

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      reverseDuration: Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: .0,
      end: .4,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(150)),
      child: Container(
        alignment: Alignment.center,
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: _colors,
            stops: _stops.map((s) => s + _animation.value).toList(),
          ),
        ),
      ),
    );
  }
}
