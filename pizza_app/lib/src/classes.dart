import './constants.dart';

class PizzaCalculator {


  DoughTypes? selectedDough = DoughTypes.normal;
  Sizes? selectedSize = Sizes.standard;
  SaucesEnum? selectedSauce = SaucesEnum.spicy;
  bool? doubleCheese = false;

  PizzaCalculator(
      [
        DoughTypes? dough,
        Sizes? size,
        SaucesEnum? sauce,
        bool? cheese
      ]) {
    selectedDough = dough;
    selectedSize = size;
    selectedSauce = sauce;
    doubleCheese = cheese;
  }

  num updateCost () {
    print(PizzaCalculator);
    return 0;
  }
}