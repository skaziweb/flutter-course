import 'package:flutter/material.dart';
import 'package:pizza_app/src/third_screen.dart';

import 'sign_in_page.dart';
import 'calculator.dart';

class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza app',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute:  '/',
      routes: {
        '/': (context) => const PizzaAppHomePage(title: 'Pizza calculator'),
        '/signin': (context) => const MyHomePage(title: 'Sign in page'),
        '/about': (context) => const ThirdPage(),
      },
    );
  }
}


