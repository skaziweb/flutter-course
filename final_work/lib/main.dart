import 'package:flutter/material.dart';

import 'screens/authorization.dart';

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
      home: const AuthorizationPage(title: 'Graduation project'),
    );
  }
}

void main() {
  runApp(
      const MyApp()
  );
}