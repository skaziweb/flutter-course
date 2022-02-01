import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import '../style/styles.dart';

class PizzaCalculator {

  num _baseCost = 100;
  int selectedDough = 0;
  int selectedSize = 0;
  SaucesEnum? selectedSauce = SaucesEnum.spicy;
  bool doubleCheese = false;

  PizzaCalculator(num cost, int dough, int size, SaucesEnum? sauce, bool cheese) {
    _baseCost = cost;
    selectedDough = dough;
    selectedSize = size;
    selectedSauce = sauce;
    doubleCheese = cheese;
  }

  String updateCost () {

    num baseCost = _baseCost;
    int doughCost = selectedDough + 1;
    int sizeCost = selectedSize + 1;
    int sauceCost = 1;
    int cheeseCost = doubleCheese ? 2 : 1;

    switch (selectedSauce) {
      case SaucesEnum.sourSweet:
        sauceCost = 2;
        break;
      case SaucesEnum.cheese:
        sauceCost = 3;
        break;
      default:
        sauceCost = 1;
    }

    return (baseCost * doughCost * sizeCost * sauceCost * cheeseCost).toString() ;
  }

  Widget orderInfo () {
    var sauces = ['Острый' , 'Кисло-сладкий', 'Сырный'];
    var sizes = ['Маленькая' , 'Средняя', 'Большая'];
    int sauceCost = 1;
    switch (selectedSauce) {
      case SaucesEnum.sourSweet:
        sauceCost = 1;
        break;
      case SaucesEnum.cheese:
        sauceCost = 2;
        break;
      default:
        sauceCost = 0;
    }

    Padding listItem (String text, bool disabledIcon) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            !disabledIcon ? const Padding(
              padding: EdgeInsets.only(right: 4),
              child: Icon(Icons.fiber_manual_record),
            ) : const Text(''),
            Padding(
              padding: !disabledIcon ? const EdgeInsets.only(top: 1) : const EdgeInsets.only(top: 16, left: 4),
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ],
        ),
      );
    }

    return Wrap(
      direction: Axis.horizontal,
      children: <Widget>[
        listItem('Тесто: ${selectedDough == 0 ? 'обычное' : 'тонкое'}', false),
        listItem('Размер: ${sizes[selectedSize]}', false),
        listItem('Соус: ${sauces[sauceCost]}', false),
        doubleCheese ? listItem('Сырный борт', false) : const Text(''),
        listItem('Сумма заказа: ${updateCost()}', true),
      ],
    );
  }
}