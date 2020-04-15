
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home:Scaffold(
        appBar: AppBar(
        backgroundColor:Colors.blueGrey[900],
        title: Text('BLOG APP'),
        ),
        backgroundColor:Colors.blueGrey[400],
        body: Image(
          
          
          image: AssetImage('images/diamond.png'),
        ),  
      ),
    ),
  );
}
