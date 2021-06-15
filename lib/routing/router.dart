import 'package:calculatorbutcomplex/calculation.dart';
import 'package:calculatorbutcomplex/calculator.dart';
import 'package:calculatorbutcomplex/menu.dart';
import 'package:calculatorbutcomplex/routing/routing_constants.dart';
import 'package:flutter/material.dart';

import '../calc1.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Calculation calc = new Calculation();
  switch (settings.name) {
    case MenuViewRoute:
      return MaterialPageRoute(builder: (context) => Menu());
    case Calc1ViewRoute:
      return MaterialPageRoute(builder: (context) => Calculator("+","-"));
    case Calc2ViewRoute:
      return MaterialPageRoute(builder: (context) => Calculator('*', '/'));
    default:
      return MaterialPageRoute(builder: (context) => Menu());
  }
}
