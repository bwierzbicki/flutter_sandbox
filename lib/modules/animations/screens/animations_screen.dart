import 'package:flutter/material.dart';
import 'package:flutter_sandbox/modules/animations/widgets/animated_gradient.dart';
import 'package:flutter_sandbox/modules/animations/widgets/test_animated_container.dart';

class AnimationsScreen extends StatefulWidget {
  static String routeName = '/animations';

  @override
  _AnimationsScreenState createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Animated gradient',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 300,
              alignment: Alignment.center,
              child: AnimatedGradient(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Animated container',
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              'tap to animate',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: 10,
            ),
            TestAnimatedContainer(),
          ],
        ),
      ),
    );
  }
}
