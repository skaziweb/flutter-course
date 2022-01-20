import 'package:flutter/material.dart';
import 'package:pizza_app/helpers/pizzaTheme.dart';
import 'package:pizza_app/screens/calculator.dart';
import 'package:pizza_app/screens/sign_in_page.dart';
import 'package:pizza_app/screens/third_screen.dart';
import 'package:pizza_app/screens/user_list.dart';


class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza app',
      theme: PizzaTheme(),
      initialRoute:  '/',
      routes: {
        '/': (context) => const PizzaAppHomePage(title: 'Pizza calculator'),
        '/signin': (context) => const MyHomePage(title: 'Sign in page'),
        '/about': (context) => const ThirdPage(),
        '/users': (context) => const UserList(),
      },
    );
  }
}


