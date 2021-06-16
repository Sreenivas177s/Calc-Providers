import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculation with ChangeNotifier {
  String _screen = "", _final = "";
  void ezcalculation() {
    if (_screen != "") {
      if (_screen[0] == "+" ||
          _screen[0] == "-" ||
          _screen[0] == "*" ||
          _screen[0] == "/") {
        _screen = _final+_screen;
      }
      try {
        Parser p = Parser();
        Expression exp = p.parse(_screen);
        ContextModel cm = ContextModel();
        _final = (exp.evaluate(EvaluationType.REAL, cm)).ceil().toString();
      } on RangeError catch (e) {
        // TODO
      }
    }
  }

  void setScreen(String screen) {
    this._screen = screen;
    notifyListeners();
  }

  String getScreen() {
    return this._screen;
  }

  String getValue() {
    return this._final;
  }

  void setValue(String value) {
    this._final = value;
    notifyListeners();
  }
}
