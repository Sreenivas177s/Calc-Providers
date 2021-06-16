import 'package:calculatorbutcomplex/calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator.dart';
import 'menu.dart';



const String MenuViewRoute = '/';
const String Calc1ViewRoute = 'calculator1';
const String Calc2ViewRoute = 'calculator2';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Calculation(),
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATOR SEPARATED',
      onGenerateRoute: (RouteSettings settings){
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
      },
      initialRoute: MenuViewRoute,
      theme: ThemeData.dark(),
      
    );
  }
}