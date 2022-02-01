import 'package:flutter/material.dart';

import 'screens/authorization_form.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graduation project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:  '/',
      routes: {
        '/': (context) => const AuthorizationPage(title: 'Authorization Page',),
        '/users': (context) => const AuthorizationPage(title: 'User List',),
      },
    );
  }
}

void main() {
  runApp(
      const MyApp()
  );
}