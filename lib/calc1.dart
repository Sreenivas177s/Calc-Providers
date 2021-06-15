import 'package:calculatorbutcomplex/calculation.dart';
import 'package:flutter/material.dart';

String globval = "";

class Calc1 extends StatefulWidget {
  var calc;
  Calc1(this.calc,);

  @override
  _Calc1State createState() => _Calc1State();
}

class _Calc1State extends State<Calc1> {
  String box_1 = "", box_2 = "", screen = "";
  String num1 = "", num2 = "", op = "", temp_calc = "";

  ElevatedButton numberpads(String numm) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          box_1 += numm;
          screen += numm;
        });
        if (op != "" && num1 != "") {
          num2 = box_1;
          print("num1 - $num1");
          print("num2 - $num2");
          //calculateValue();
          widget.calc.setScreen(screen);
          widget.calc.ezcalculation();
          temp_calc = widget.calc.getValue();
          setState(() {
            if (temp_calc != "") box_2 = temp_calc;
          });
        }
      },
      child: Text(numm),
    );
  }

  Container dispbox(String val) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Text(
          val,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      color: Colors.white,
      width: 300,
      alignment: Alignment.centerRight,
      height: 30,
    );
  }

  ElevatedButton oppads(String opp) {
    return ElevatedButton(
      onPressed: () {
        if (num1 == "") num1 = box_1;

        setState(() {
          box_1 = "";
          screen += " $opp ";
        });
        op = opp;
        if (num2.isNotEmpty) num1 = temp_calc;
      },
      child: Text(opp),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dispbox(screen),
          dispbox(box_2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberpads("1"),
              numberpads("2"),
              numberpads("3"),
              oppads("+"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberpads("4"),
              numberpads("5"),
              numberpads("6"),
              oppads("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberpads("7"),
              numberpads("8"),
              numberpads("9"),
              numberpads("0"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (screen.isNotEmpty) {
                      screen = screen.substring(0, screen.length - 1);
                      if (screen == "") {
                        num1 = "";
                        op = "";
                      }
                      print(screen);
                    }
                  });
                  try {
                    if (op != "" && num1 != "") {
                      widget.calc.setScreen(screen);
                      widget.calc.ezcalculation();
                      setState(() {
                        box_2 = widget.calc.getValue();
                      });
                    }
                  } on RangeError catch (e) {
                    box_2 = "ERROR";
                  }
                },
                child: Icon(Icons.keyboard_backspace),
              ),
              ElevatedButton(
                onPressed: () {
                  num1 = "";
                  num2 = "";
                  op = "";
                  setState(() {
                    box_1 = "";
                    box_2 = "";
                    temp_calc = "";
                    screen = "";
                  });
                },
                child: Text("RESET"),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (globval != "") {
                      setState(() {
                        box_1 += " $globval";
                        screen += " $globval";
                      });
                      try {
                        if (op != "" && num1 != "") {
                          widget.calc.setScreen(screen);
                          widget.calc.ezcalculation();
                          setState(() {
                            box_2 = widget.calc.getValue();
                          });
                        }
                      } on RangeError catch (e) {
                        box_2 = "ERROR";
                      }
                    }
                  },
                  child: Text("Import")),
              ElevatedButton(
                  onPressed: () {
                    globval = box_2;
                    Navigator.pop(context);
                  },
                  child: Text("BACK"))
            ],
          ),
        ],
      ),
    );
  }
}
