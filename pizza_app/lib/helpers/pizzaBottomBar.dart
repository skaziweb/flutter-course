import 'package:flutter/material.dart';

final PizzaBottomNavigationBar = (context, widget, index, onTap) => BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate_outlined),
      label: 'Calculator',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'Sign In',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info_outline),
      label: 'About',
    ),
  ],
  currentIndex: index,
  selectedItemColor: Colors.orangeAccent,
  onTap: onTap,
) as Widget;