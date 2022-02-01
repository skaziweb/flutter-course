import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:final_work/classes/User.dart';
import 'package:final_work/helpers/AppBar.dart';
import 'package:final_work/helpers/DrawerMenu.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

Future<List<User>> fetchUsers() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    final List<User> usersList = [];
    for (var user in data) {
      User temp = User.fromJson(user);
      usersList.add(temp);
    }
    return usersList;
  } else {
    throw Exception('Failed to load album');
  }
}

class _UsersListPageState extends State<UsersListPage> {

  late Future<List<User>> usersList;

  @override
  void initState() {
    super.initState();
    usersList = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(context, widget),
      drawer: UserAppDrawer(context, widget),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
                future: usersList,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<User> users = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, i) {
                            User user = users[i];
                            return ListTile(
                              trailing: const Icon(Icons.supervised_user_circle_outlined),
                              title: Text(user.name),
                              subtitle: Text(user.email),
                              leading: Text(
                                user.id.toString(),
                                style: const TextStyle(fontSize: 22),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/info', arguments: {'user': user},);
                              },
                            );
                          },
                          itemCount: 10,
                      ),
                    );
                  }
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 0),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator()
                        ),
                    ),
                  );
                },
              ),
          ],
        ),
    );
  }
}
