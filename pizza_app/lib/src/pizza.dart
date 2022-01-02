import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '_variables.dart';
import 'constants.dart';

class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PizzaAppHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class PizzaAppHomePage extends StatefulWidget {
  const PizzaAppHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PizzaAppHomePage> createState() => _PizzaAppHomePageState();
}

class _PizzaAppHomePageState extends State<PizzaAppHomePage> {

  num cost = 0;

  void updateCost () {
    num baseCost = 200;
    num doughCost = 0.5;
    num sizeCost = 1;
    num sauceCost = 1;

    if (selectedDough == 0) {
      doughCost = 0.5;
    } else {
      doughCost = 1;
    }

    if (selectedSize == 0) {
      sizeCost = 1;
    } else if (selectedSize == 1) {
      sizeCost = 1.5;
    } else {
      sizeCost = 1.75;
    }

    if (_selectedSauce == SaucesEnum.spicy) {
      sauceCost = 1;
    } else if (_selectedSauce == SaucesEnum.sourSweet) {
      sizeCost = 1.5;
    } else {
      sizeCost = 1.75;
    }

    setState(() => {
      cost = baseCost * doughCost * sizeCost * sauceCost
    });
  }



  SaucesEnum? _selectedSauce = SaucesEnum.spicy ;
  int selectedDough = 0;
  int selectedSize = 0;

  final borderStyles =
      const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SizedBox(
                    width: 230,
                    height: 120,
                    child: Image(
                        image: AssetImage('assets/img/pizza.png'),
                        fit: BoxFit.contain),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Калькулятор пиццы',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                            letterSpacing: 1
                        )
                    ),
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Выберите параметры:',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.black,
                          letterSpacing: 1
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToggleSwitch(
                  minWidth: 280.0,
                  cornerRadius: 20.0,
                  activeBgColors: [[Colors.orangeAccent], [Colors.orangeAccent]],
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: selectedDough,
                  totalSwitches: 2,
                  animate: true,
                  labels: ['Обычное тесто', 'Тонкое тесто'],
                  radiusStyle: true,
                  onToggle: (index) {
                    setState(() {
                      selectedDough = index;
                    });
                    updateCost();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ToggleSwitch(
                  minWidth: 280.0,
                  activeBgColors: [[Colors.green], [Colors.yellow], [Colors.red]],
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: selectedSize,
                  totalSwitches: 3,
                  labels: ['Маленькая', 'Средняя', 'Большая'],
                  onToggle: (index) {
                    setState(() {
                      selectedSize = index;
                    });
                    updateCost();
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Соус:',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.black,
                                letterSpacing: 1
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Острый'),
                    groupValue: _selectedSauce,
                    value: SaucesEnum.spicy,
                    activeColor: Colors.orangeAccent,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (SaucesEnum? value) => {
                      setState(() => {
                        _selectedSauce = value
                      })
                    },
                  ),
                  RadioListTile(
                    title: const Text('Кисло-сладкий'),
                    groupValue: _selectedSauce,
                    value: SaucesEnum.sourSweet,
                    activeColor: Colors.orangeAccent,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (SaucesEnum? value) => {
                      setState(() => {
                        _selectedSauce = value
                      })
                    },
                  ),
                  RadioListTile(
                    title: const Text('Сырный'),
                    groupValue: _selectedSauce,
                    value: SaucesEnum.cheese,
                    activeColor: Colors.orangeAccent,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (SaucesEnum? value) => {
                      setState(() => {
                        _selectedSauce = value
                      })
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Стоимость:',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.black,
                                letterSpacing: 1
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: cost.toString(),
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.black,
                        letterSpacing: 1
                    )
                ),
              ),
            ),
            ],
          ),
        ),
    ));
  }
}
