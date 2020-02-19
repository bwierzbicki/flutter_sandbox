import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/modules/provider/screens/provider_screen.dart';
import 'package:flutter_calendar/modules/workflow/screens/workflow_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  Widget _buildButton(BuildContext context, String name, String routeName) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        name,
        style: TextStyle(
          fontSize: Theme.of(context).primaryTextTheme.title.fontSize,
        ),
      ),
      elevation: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildButton(
                context,
                'Provider pattern',
                ProviderScreen.routeName,
              ),
              _buildButton(
                context,
                'Workflow module POC',
                WorkflowScreen.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
