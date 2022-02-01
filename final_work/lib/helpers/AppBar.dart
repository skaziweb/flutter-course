import 'package:flutter/material.dart';

final UserAppBar = (context, widget) => AppBar(
  title: Text(widget.title),
  actions: <Widget>[
    IconButton(
      icon: const Icon(Icons.account_circle_outlined),
      onPressed: () {
        Navigator.pushNamed(context, '/users');
      },
    ),
    IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: () {
        Navigator.pushNamed(context, '/about');
      },
    )
  ],
);