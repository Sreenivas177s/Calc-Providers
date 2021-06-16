import 'package:calculatorbutcomplex/menu.dart';
import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculation with ChangeNotifier {
  String _screen = "", _final = "";
  Future<void> ezcalculation() async {
    if (_screen != "") {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_screen);
        ContextModel cm = ContextModel();
        await db.rawUpdate('UPDATE Calculator SET finalvalue=?',
            [(exp.evaluate(EvaluationType.REAL, cm)).ceil().toString()]);
        _final = (await db.rawQuery('SELECT * FROM Calculator'))[0]['finalvalue'];
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
