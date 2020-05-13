import 'package:flutter/material.dart';
import 'db.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Grade Viewer App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:[
              TextField(
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                labelText: 'Username'
              ),),

              SizedBox(height: 20,),
              
              TextField(obscureText: true,
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                labelText: 'Password'
              ),),
              SizedBox(height: 20,),
              Row(
                
                children: <Widget>[
                  Expanded(                    
                    child: RaisedButton(                                  
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text("Button"),
                      textColor: Colors.white,
                      
                      
                    )
                  ,
                  ),
                ],
              )
            ]
          ),
        ),
      ),
      
    );
  }
}
