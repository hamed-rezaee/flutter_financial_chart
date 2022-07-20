import 'package:flutter/material.dart';

import 'package:flutter_financial_chart/presentation/pages/home_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Financial Chart',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: const HomePage(title: 'Flutter Financial Chart'),
      );
}
