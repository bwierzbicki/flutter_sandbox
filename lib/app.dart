import 'package:flutter/material.dart';
import 'package:flutter_calendar/modules/provider/screens/provider_screen.dart';
import 'package:flutter_calendar/modules/workflow/screens/workflow_screen.dart';

import './home_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Sandbox',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: HomeScreen(title: 'My Flutter Sandbox'),
      routes: {
        ProviderScreen.routeName: (_) => ProviderScreen(),
        WorkflowScreen.routeName: (_) => WorkflowScreen(),
      },
    );
  }
}
