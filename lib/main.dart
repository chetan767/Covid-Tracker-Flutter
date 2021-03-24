import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/data/CovidData.dart';
import 'package:tracker/data/NewsData.dart';
import 'package:tracker/screens/NewsScreen.dart';

import 'screens/CasesScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/PieScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsData>(
          create: (_) => NewsData(),
        ),
        ChangeNotifierProvider<CovidData>(
          create: (_) => CovidData(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          '/news': (context) => NewsScreen(),
          '/recovery': (context) => PieScreen(),
          '/cases': (context) => CasesScreen(),
        },
      ),
    );
  }
}

//0828df72398744e5a1fe8f75838a4c76
