import 'package:calculatorbutcomplex/routing/routing_constants.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATOR SEPARATED"),
        actions: [
          PopupMenuButton(icon: Icon(Icons.menu)
            ,onSelected:(String item)=>Navigator.pushNamed(context, item)

            ,itemBuilder: (context)=>[
            PopupMenuItem<String>(child: Text("CALC 1"),
            value: Calc1ViewRoute,),
            PopupMenuItem<String>(child: Text("CALC 2"),
            value: Calc2ViewRoute,),
          ]),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("CALCULATOR",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            Text("TO PERFORM\nADDITION , SUBTRACTION ,\nMULTIPLICATION , DIVISION and soo on",style: 
            TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
