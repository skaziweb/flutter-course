import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {

  String _password = '';
  String _phone = '+';
  bool _isErrorHandled = false;

  final user = {
    "phone": "+789123456789",
    "password": "qwerty12345"
  };

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

  bool checkAuth () {
    if (_phone == user['phone'] && _password == user['password']) {
      return false;
    }

    return true;
  }

  void signIn () => {
    setState(() {
        _isErrorHandled = checkAuth();
    })
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: _isErrorHandled == true ? const Text(
                          'Неверный номер телефона или пароль',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.normal),
                      ) : const Text(''),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    keyboardType: TextInputType.phone,
                    onChanged: setPhone,
                    textInputAction: TextInputAction.next,
                    initialValue: _password,
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: setPassword,
                  textInputAction: TextInputAction.next,
                  initialValue: _password,
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text('Войти'),
                      onPressed: signIn,
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
