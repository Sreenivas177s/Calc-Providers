import 'package:calculatorbutcomplex/calculator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Map> a = [];
List<String> opvalues = [];

class History extends StatefulWidget {
  String op1 = "";
  String op2 = "";
  History(this.op1, this.op2);
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  void _getData() {
    opvalues = [];
    for (int i = 0; i < keys.length; i++)
      if ((keys[i].split(widget.op1)).length > 1 ||
          (keys[i].split(widget.op2)).length > 1) {
        opvalues.add(keys[i]);
      }
  }

  @override
  void initState() {
    super.initState();
    _getData();
    print(keys);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
        title: Text("History"),
      ),
      body: Column(children: [
        (a.length != 0)
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: opvalues.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      "${index + 1}. ${opvalues[index]}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    subtitle: Text("      ${prefs.getString(opvalues[index])}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  );
                })
            : Center(
                child: Text("SORRY! there were no previous Calculations",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
        ElevatedButton(
            onPressed: () => Navigator.pop(context), child: Text("BACK"))
      ]),
    );
  }
}
