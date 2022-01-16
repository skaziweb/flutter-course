import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'classes.dart';
import 'constants.dart';
import 'styles.dart';

class PizzaAppHomePage extends StatefulWidget {
  const PizzaAppHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PizzaAppHomePage> createState() => _PizzaAppHomePageState();
}

class _PizzaAppHomePageState extends State<PizzaAppHomePage> {

  PizzaCalculator pizza = PizzaCalculator(100, 0, 0, SaucesEnum.spicy , true);

  final borderStyles =
  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

  void setSauce (SaucesEnum? value) {
    setState(() {
      pizza.selectedSauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: Text('App menu'),
                ),
                ListTile(
                  title: const Text('Pizza Calculaton'),
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                ListTile(
                  title: const Text('Sign in page'),
                  onTap: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                ),
              ]
          )
      ),
      appBar: AppBar(
        title: Text(widget.title),
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
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      backgroundColor: Colors.orange,
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
                  style: textStyle
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleSwitch(
                minWidth: 280.0,
                cornerRadius: 20.0,
                activeBgColors: [[Colors.orangeAccent], [Colors.orangeAccent]],
                activeFgColor: Colors.black,
                inactiveBgColor: Colors.blueGrey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: pizza.selectedDough,
                totalSwitches: 2,
                animate: true,
                labels: ['Обычное тесто', 'Тонкое тесто'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    pizza.selectedDough = index;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleSwitch(
                minWidth: 280.0,
                activeBgColors: [[Colors.green], [Colors.yellow], [Colors.red]],
                activeFgColor: Colors.black,
                inactiveBgColor: Colors.blueGrey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: pizza.selectedSize,
                totalSwitches: 3,
                labels: ['Маленькая', 'Средняя', 'Большая'],
                onToggle: (index) {
                  setState(() {
                    pizza.selectedSize = index;
                  });
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
                        style: textStyle
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                RadioListTile(
                  title: const Text('Острый'),
                  groupValue: pizza.selectedSauce,
                  value: SaucesEnum.spicy,
                  activeColor: Colors.yellow,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: setSauce,
                ),
                RadioListTile(
                  title: const Text('Кисло-сладкий'),
                  groupValue: pizza.selectedSauce,
                  value: SaucesEnum.sourSweet,
                  activeColor: Colors.yellow,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: setSauce,
                ),
                RadioListTile(
                  title: const Text('Сырный'),
                  groupValue: pizza.selectedSauce,
                  value: SaucesEnum.cheese,
                  activeColor: Colors.yellow,
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: setSauce,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: pizza.doubleCheese ? Colors.yellow : Colors.deepOrangeAccent,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(16)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/img/cheese.png'),
                        color: Colors.black,
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'Сырный борт',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                )
                            )
                        ),
                      ),
                      Switch(
                          value: pizza.doubleCheese,
                          activeColor: Colors.yellowAccent,
                          inactiveThumbColor: Colors.deepOrangeAccent,
                          onChanged: (value) => {
                            setState(() => {
                              pizza.doubleCheese = !pizza.doubleCheese
                            })
                          }
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: 'Стоимость:',
                        style: textStyle
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: pizza.updateCost(),
                  style: textStyle
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
                      ),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                            text: 'Сделать заказ',
                            style: textStyle
                        ),
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.orange,
                          title: const Text('Подтвердите заказ:'),
                          content: pizza.orderInfo(),
                          actions: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              ),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Отменить'),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              ),
                              onPressed: () => {
                                Navigator.pop(context, 'OK'),
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Ваш заказ оформлен. Спасибо за заказ!')))
                              },
                              child: const Text('Заказать'),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}