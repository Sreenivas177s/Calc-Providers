import 'package:calculatorbutcomplex/calculation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  String box_1 = "";
  String box_2 = "", screen = "";
  String num1 = "", num2 = "", op = "", temp_calc = "";
  String op1 = "", op2 = "";
  Calculator(this.op1, this.op2);

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

  @override
  Widget build(BuildContext context) {
    ElevatedButton oppads(String opp) {
      return ElevatedButton(
        onPressed: () {
          if (num1 == "") num1 = box_1;
          box_1 = "";
          screen += " $opp ";
          op = opp;
          var cart = context.read<Calculation>();
          cart.setScreen(screen);
          if (num2.isNotEmpty) num1 = temp_calc;
        },
        child: Text(opp),
      );
    }

    ElevatedButton numberpads(String numm) {
      return ElevatedButton(
        onPressed: () {
          box_1 += numm;
          screen += numm;
          var cart = context.read<Calculation>();
          print("screen - $screen");
          cart.setScreen(screen);
          if (op != "") {
            num2 = box_1;
            
            cart.ezcalculation();
            cart.setScreen(screen);
          }
        },
        child: Text(numm),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Consumer<Calculation>(
            builder: (context, cart, child) {
              return dispbox(cart.getScreen());
            },
          ),
          Consumer<Calculation>(
            builder: (context, cart, child) {
              return dispbox(cart.getValue());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberpads("1"),
              numberpads("2"),
              numberpads("3"),
              oppads(op1),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              numberpads("4"),
              numberpads("5"),
              numberpads("6"),
              oppads(op2),
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
                  var cart = context.read<Calculation>();
                  if (screen!="") {
  screen = screen.substring(0, screen.length - 1);
}
                  cart.setScreen(screen);
                  cart.ezcalculation();
                },
                child: Icon(Icons.keyboard_backspace),
              ),
              ElevatedButton(
                onPressed: () {
                  num1 = "";
                  num2 = "";
                  op = "";
                  box_1 = "";
                  box_2 = "";
                  temp_calc = "";
                  screen = "";
                  var cart = context.read<Calculation>();
                  cart.setScreen("");
                  cart.setValue(screen);
                },
                child: Text("RESET"),
              ),
              ElevatedButton(
                  onPressed: () {
                    var cart = context.read<Calculation>();
                    screen += cart.getValue();
                    cart.setScreen(screen);
                    cart.ezcalculation();
                    cart.setScreen(screen);
                  },
                  child: Text("ANS")),
              ElevatedButton(
                  onPressed: () {
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
