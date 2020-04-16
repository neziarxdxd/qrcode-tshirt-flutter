
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home:Scaffold(
        
        backgroundColor:Colors.blueGrey[900],
        body:
         
           Column(
            
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Center(
                child: Text('LOGIN')
              ),
            ),
             Padding(
               padding: EdgeInsets.only(
                 top: 40.0,
                 left:16.0,
                 right:16.0,                 
               ),
                
                child: TextField(               
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
            ),
             )

            ],
          ),
        ),
        
      ),
    
  );
}
