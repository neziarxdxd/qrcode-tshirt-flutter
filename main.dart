import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement 
    TextEditingController myController = TextEditingController();
    TextEditingController myController_2 = TextEditingController();

    return  MaterialApp(
    home:Scaffold(
      appBar: AppBar(
      title: Text("Hello"),
      centerTitle: true,
    ),
    body:    
    Column(    
      
  // gap between lines
  children: <Widget>[
    Padding(padding: EdgeInsets.only(left: 20.0,right: 50,top: 50),
    child:TextField(
      controller: myController,
      decoration: InputDecoration(labelText:'My Name'),))
    ,
    Padding(padding: EdgeInsets.only(left: 20.0,right:50),
    child:TextField(
      controller: myController_2,
      decoration: InputDecoration(labelText:'My Password'),))
    ,
    LoginButton()
    
    
  ],
)
   
    ),


    
    
    
    
  );
  }

}
class LoginButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child:RaisedButton(child: Text("Login"), onPressed: () {
        login(context);
        print("Hi23232");},
      ) 
      
      );
    
  }

  void login(BuildContext context){
    var alertDialog= AlertDialog(
      title: Text("Hi"),
      content: Text("Thank you LORD"),
    );
    showDialog(context: context,
    builder: (BuildContext context){
      return alertDialog;
    }
    );
  }

}