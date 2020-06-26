import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
      body:Column(children: <Widget>[
        FlatButton(onPressed: (){}, child: Text("dfd")),
        Flexible(child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ADDTile(),
        ))
      ],),
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
    
    TheCards("dfdfd",Colors.red,"Read Book"),
    TheCards("dfdfdwe",Colors.blue,"Maligo"),
    TheCards("dfdfd",Colors.green,"Read Book"),
    TheCards("dfdfdwe",Colors.purple,"Maligo"),
    TheCards("dfdfd",Colors.pink,"Read Book"),
    TheCards("dfdfdwe",Colors.blue,"Maligo"),
    TheCards("dfdfd",Colors.red,"Read Book"),
    TheCards("dfdfdwe",Colors.green,"Maligo"),
    TheCards("dfdfd",Colors.red,"Read Book"),
    TheCards("dfdfdwe",Colors.blue,"Maligo"),
    TheCards("dfdfd",Colors.red,"Read Book"),
    TheCards("dfdfdwe",Colors.blue,"Maligo"),


   
   
  ],
);
  }
}
class TheCards extends StatelessWidget {
  final String name;
  final Color color;
  final String habitName;
  TheCards(this.name, this.color, this.habitName);
  @override
  Widget build(BuildContext context) {
    return
     Card(child: ListTile(subtitle: Text("dfdfdkfkdkdfer"),leading: Icon(Icons.image),title: new LinearPercentIndicator(
      width: 170.0,
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(habitName),
                ),
               
                percent: 0.7565645,
                center: Text("5.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: color,
    ),
     ));
  }
}