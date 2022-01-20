import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Users List'),
            leading: IconButton(
              icon: const Icon(Icons.navigate_before_outlined),
              tooltip: 'Go back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: const Center(child: Text('User list')),
      ),
    );
  }
}
