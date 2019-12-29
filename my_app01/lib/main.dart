import 'package:flutter/material.dart';

void main() => runApp(MyApp());

TextEditingController myController = TextEditingController();
TextEditingController myController_2 = TextEditingController();

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {  
    return  MaterialApp(
    home:Scaffold(
      appBar: AppBar(
      title: Text("Calculator App"),
      centerTitle: true,
    ),
    body:    
    Column(    
      
  // gap between lines
  children: <Widget>[
    Padding(padding: EdgeInsets.only(left: 20.0,right: 50,top: 50),
    child:TextField(
      controller: myController,
      decoration: InputDecoration(labelText:'First Number'),
      )
    )
    ,
    Padding(padding: EdgeInsets.only(left: 20.0,right:50),
    child:TextField(
      controller: myController_2,
      decoration: InputDecoration(labelText:'Second Number'),
      )
    )
    ,
    loginButton("+"),
    loginButton("-"),
    loginButton("/"),
    loginButton("*"),  
    
    
  ],
    )   
  ),      
);
}
}
class loginButton extends StatelessWidget{
    var operation;
    loginButton(this.operation);  
    @override
    Widget build(BuildContext context) {
      return Container(
          child:RaisedButton(child: Text(operation), onPressed: () {
          var num1= double.parse(myController.text);
          var num2=double.parse(myController_2.text);
          login(context,num1,num2,operation);
          
          print("Hi23232");},
        )
        );
      
    }

    void login(BuildContext context, double num1, double num2,operation){
      double answer=0;
      if (operation=="+"){answer=num1+num2;}
      else if (operation=="-"){ answer = num1-num2; }
      else if(operation=="/"){answer = num1/num2;}
      else if (operation == "*"){answer = num1*num2;}
      else{answer=0;}   

      var alertDialog= AlertDialog(
          title: Text("Answer"),
          content: Text("$answer"),        
        );


        showDialog(context: context,
        builder: (BuildContext context){
        return alertDialog;
        }
      );
    }

}