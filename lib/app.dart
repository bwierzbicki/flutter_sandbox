import 'package:flutter/material.dart';
import 'package:flutter_sandbox/modules/itunes/screens/itunes_screen.dart';

import './home_screen.dart';
import './modules/animations/screens/animations_screen.dart';
import './modules/provider/screens/provider_screen.dart';
import './modules/workflow/screens/workflow_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Sandbox',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.normal,
          ),
        ),
        primarySwatch: Colors.brown,
      ),
      home: HomeScreen(title: 'My Flutter Sandbox'),
      routes: {
        AnimationsScreen.routeName: (_) => AnimationsScreen(),
        ProviderScreen.routeName: (_) => ProviderScreen(),
        WorkflowScreen.routeName: (_) => WorkflowScreen(),
        ItunesScreen.routeName: (_) => ItunesScreen(),
      },
    );
  }
}
