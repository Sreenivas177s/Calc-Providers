import 'package:calculatorbutcomplex/calculation.dart';
import 'package:calculatorbutcomplex/routing/routing_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routing/router.dart' as router;

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
      onGenerateRoute: router.generateRoute,
      initialRoute: MenuViewRoute,
      theme: ThemeData.dark(),
      
    );
  }
}