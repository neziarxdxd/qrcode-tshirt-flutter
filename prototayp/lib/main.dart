import 'package:flutter/material.dart';
import 'theOtherCard.dart';
import 'theCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Habit Tracker')),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(onPressed: () {}, child: Text("dfd")),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ADDTile(),
          ))
        ],
      ),
    );
  }
}

class ADDTile extends StatefulWidget {
  @override
  _ADDTileState createState() => _ADDTileState();
}

class _ADDTileState extends State<ADDTile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PercentageCard("dfdfd", Colors.red, "Read Book"),
        TheCards("dfdfd", Colors.red, "Read Book"),
        TheCards("dfdfdwe", Colors.blue, "Maligo"),
        TheCards("dfdfd", Colors.green, "Program for Structure"),
      ],
    );
  }
}
