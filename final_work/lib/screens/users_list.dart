import 'package:final_work/classes/Users.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

Future<List<Users>> fetchUsers() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    final List<Users> usersList = [];
    for (var user in data) {
        usersList.add(Users.fromJson(user));
    }
    print(usersList);
    return usersList;
  } else {
    throw Exception('Failed to load album');
  }
}

class _UsersListPageState extends State<UsersListPage> {

  late Future<Users> usersList;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,40,0,0),
                    child: FlutterLogo(size: 80),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: ElevatedButton(
                      onPressed: fetchUsers,
                      child: const Text('Load data'),
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
