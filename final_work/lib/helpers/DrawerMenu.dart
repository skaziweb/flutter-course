import 'package:flutter/material.dart';

final Devider = Divider(
  height: 3,
  thickness: 1,
  indent: 20,
  endIndent: 20,
  color: Colors.black,
);

final UserAppDrawer = (context, widget) => Drawer(
    child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: FlutterLogo(size: 80),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              title: const Text('Users list'),
              onTap: () {
                Navigator.pushNamed(context, '/users');
              },
            ),
          ),
          Devider,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: const Text('About app'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ),
        ]
    )
) as Widget;