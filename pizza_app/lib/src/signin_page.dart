import 'package:flutter/material.dart';
import '_variables.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final borderStyles =
      const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 8),
                child: SizedBox(
                  width: 112,
                  height: 80,
                  child: Image(
                      image: AssetImage('assets/img/dart-logo.png'),
                      fit: BoxFit.cover),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    labelText: 'Введите телефон',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    labelText: 'Введите пароль',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: 196,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('Войти'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 64, 0, 8),
                child: SizedBox(
                  width: 196,
                  height: 20,
                  child: Text('Регистрация', textAlign: TextAlign.center, style: TextStyle(
                    color: Color.fromRGBO(0, 121, 208, 1),
                    fontSize: 20
                  ),)
                  ),
                ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SizedBox(
                    width: 196,
                    height: 20,
                    child: Text('Забыли пароль?', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(0, 121, 208, 1),
                      fontSize: 20
                    ),)
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
