import 'package:flutter/material.dart';

final Devider = Divider(
  height: 3,
  thickness: 1,
  indent: 20,
  endIndent: 20,
  color: Colors.black,
);

final PizzaAppDrawer = (context, widget) => Drawer(
    child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Text('Pizza Calculator Menu'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              title: const Text('Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          Devider,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: const Text('Sign in'),
              onTap: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),
          ),
          Devider,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: const Text('About application'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ),
        ]
    )
) as Widget;