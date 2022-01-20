import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('About page'),
            leading: IconButton(
              icon: const Icon(Icons.navigate_before_outlined),
              tooltip: 'Go back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: const Center(child: Text('About app')),
      ),
    );
  }
}
