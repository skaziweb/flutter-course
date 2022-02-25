import 'package:final_work/screens/about.dart';
import 'package:final_work/screens/users_info.dart';
import 'package:flutter/material.dart';

import 'package:final_work/screens/users_list.dart';
import 'package:final_work/screens/authorization_form.dart';

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
        '/users': (context) => const UsersListPage(title: 'Users List',),
        '/info': (context) => const UsersInfoPage(title: 'User info',),
        '/about': (context) => const AboutPage(title: 'About app',),
      },
    );
  }
}

void main() {
  runApp(
      const MyApp()
  );
}