import 'package:flutter/material.dart';
import 'package:pizza_app/classes/User.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

final List<User> usersList = <User>[
  User("Tom", '+7-123-456-78-90'),
  User("Sam", '+7-123-456-78-91'),
  User("Alice", '+7-123-456-78-92'),
  User("Alena", '+7-123-456-78-93'),
  User("Alex", '+7-123-456-78-94'),
  User("Emma", '+7-123-456-78-95'),
  User("Max", '+7-123-456-78-96'),
  User("Dim", '+7-123-456-78-97'),
  User("Ilya", '+7-123-456-78-98'),
  User("Oleg", '+7-123-456-78-99'),
  User("John", '+7-123-456-79-00'),
  User("Celine", '+7-123-456-79-01'),
  User("Tom", '+7-123-456-79-02'),
  User("Tom", '+7-123-456-79-03'),
  User("Tom", '+7-123-456-79-04'),
  User("Tom", '+7-123-456-79-05'),
  User("Tom", '+7-123-456-79-06'),
  User("Tom", '+7-123-456-79-07'),
  User("Tom", '+7-123-456-79-08'),
  User("Tom", '+7-123-456-79-09'),
  User("Tom", '+7-123-456-79-10'),
];


class _UserListState extends State<UserList> {

  int _selectedIndex = 0;

  final ListItem = (context, item, selected, index) {
    return ;
  };

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
          body: ListView.builder(
              itemCount: 20,
              itemBuilder: ( UserListContext, index) {
                 return ListTile(
                     leading: Icon(Icons.supervised_user_circle_outlined),
                     selected: _selectedIndex == index,
                     title: RichText(
                         textAlign: TextAlign.left,
                         text: TextSpan(
                             text: 'Имя пользователя: ${usersList[index].Name}',
                             style: _selectedIndex == index ? Theme.of(context).textTheme.headline5 : Theme.of(context).textTheme.headline6,
                         )
                     ),
                     subtitle: RichText(
                       textAlign: TextAlign.left,
                       text: TextSpan(
                           text: 'Телефон пользователя:',
                           style: _selectedIndex == index ? Theme.of(context).textTheme.headline5 : Theme.of(context).textTheme.headline6,
                           children: <TextSpan>[
                             TextSpan(
                               text: '${usersList[index].Phone}',
                               style: _selectedIndex == index ? Theme.of(context).textTheme.headline5 : Theme.of(context).textTheme.headline6,
                             )
                           ]
                       ),
                     ),
                     onTap: () {
                       setState(() {
                         _selectedIndex = index;
                       });
                     }
                 );
              },
          ),
      ),
    );
  }
}
