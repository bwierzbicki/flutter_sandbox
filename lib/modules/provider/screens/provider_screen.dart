import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter.dart' as cp;
import '../widgets/counter.dart' as cw;
import '../widgets/plus_minus.dart';

class ProviderScreen extends StatefulWidget {
  static String routeName = '/provider';

  @override
  _ProviderScreenState createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => cp.Counter(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider pattern demo'),
        ),
        body: Consumer<cp.Counter>(
          builder: (_, counter, child) => Container(
            color: counter.count > 15 ? Colors.blue : Colors.white,
            child: child,
          ),
          child: Column(
            children: [
              PlusMinus(),
              Align(
                child: cw.Counter(),
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
