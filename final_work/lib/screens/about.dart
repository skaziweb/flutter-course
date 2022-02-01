import 'dart:core';
import 'package:flutter/material.dart';

import 'package:final_work/helpers/AppBar.dart';
import 'package:final_work/helpers/DrawerMenu.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(context, widget),
      drawer: UserAppDrawer(context, widget),
      body: const Center(
            child: Text(
              'About this app v1.0.0',
              style: TextStyle(fontSize: 24),
            ),
          )
    );
  }
}
