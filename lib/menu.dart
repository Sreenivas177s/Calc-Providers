
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'main.dart';

var db,filepath,filelist=[];
class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
    _listofFiles();
    _initdb();
  }

  void _initdb() async {
    db = await openDatabase('$filepath' + "/calculator.db", version: 2,
    onOpen: (Database db) async {
        await db.rawDelete('DELETE FROM Calculator WHERE op = ? OR op = ? OR op = ?OR op =?' , ['+','*','-','/']);
        await await db.rawUpdate('UPDATE Calculator SET finalvalue=?',["0"]);
    },
    onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Calculator (finalvalue TEXT ,eqn TEXT,ans TEXT,op TEXT)');
      int id1 =
          await db.rawInsert('INSERT INTO Calculator(finalvalue) VALUES("0")');
      print('inserted1: $id1');
    });

     List<Map> list = await db.rawQuery('SELECT * FROM Calculator');
//     print(list[0]['finalvalue']);
//     int count = await db.rawUpdate(
//     'UPDATE Calculator SET finalvalue=?',
//     ["dummy value"]);
// list = await db.rawQuery('SELECT * FROM Calculator');
     print(list);
  }

  void _listofFiles() async {
    filepath = (await getApplicationDocumentsDirectory()).path;
    filelist = Directory("$filepath")
        .listSync(); //use your folder name insted of resume.
  }

  @override
  void dispose() {
    db.dispose();
    super.dispose();
  }

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
            Text(
              "CALCULATOR",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Center(
              child: Text(
                "TO PERFORM\nADDITION , SUBTRACTION ,\nMULTIPLICATION , DIVISION ",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
