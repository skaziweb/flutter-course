import 'package:flutter/material.dart';

final PizzaAppBar = (context, widget) => AppBar(
  title: Text(widget.title, style: Theme.of(context).textTheme.headline1,),
  actions: <Widget>[
    IconButton(
      icon: const Icon(Icons.account_circle_outlined),
      tooltip: 'SignIn page',
      onPressed: () {
        Navigator.pushNamed(context, '/signin');
      },
    ),
    IconButton(
      icon: const Icon(Icons.info_outline),
      tooltip: 'Show Snackbar',
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('This is a snackbar')));
      },
    ),
    ElevatedButton(
      child: const Text('>'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Page with text button', style: Theme.of(context).textTheme.headline1,),
              ),
              body: const Center(
                child: Text(
                  'Third test screen',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          },
        ));
      },
    ),
  ],
) as PreferredSizeWidget;