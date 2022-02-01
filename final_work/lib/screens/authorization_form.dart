import 'package:flutter/material.dart';
import '../constants/user.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  String _password = '';
  String _phone = '';

  final _formKey = GlobalKey<FormState>();

  void setPassword (value) => {
    setState(() {
      _password = value;
    })
  };

  void setPhone (value) => {
    setState(() {
      _phone = value;
    })
  };

  void checkAuth () {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_phone == user['phone'] && _password == user['password']) {
      Navigator.pushNamed(context, '/users');
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Указанный пользователь не найден!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form (
      key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0,40,0,0),
                        child: FlutterLogo(size: 150),
                      )
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    onChanged: setPhone,
                    textInputAction: TextInputAction.next,
                    initialValue: _phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите номер телефона';
                      }
                      if (!value.contains('+')) {
                        return 'Номер должен начиная с +7';
                      }
                      if (value.length < 13) {
                        return 'Введен короткий номер, (+789123456789)';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Введите номер телефона',
                      prefixIcon: Icon(Icons.phone),
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(173, 183, 192, 1),
                          fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    onChanged: setPassword,
                    initialValue: _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите пароль';
                      }
                      if (value.length < 8) {
                        return 'Введен короткий пароль, qwerty12345';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Введите пароль',
                      prefixIcon: Icon(Icons.remove_red_eye_outlined),
                      labelStyle: TextStyle(
                          color: Color.fromRGBO(173, 183, 192, 1),
                          fontWeight: FontWeight.bold),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: ElevatedButton(
                    onPressed: checkAuth,
                    child: const Text('Войти'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
