import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
 

 
 final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
      ),
      drawer: Drawer(        
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
                  DrawerHeader(child: Text("Wala pang title",style: TextStyle(color: Colors.white,fontSize:25),),
                  decoration: BoxDecoration(color: Colors.blue),),
                  ListTile(leading: Icon(Icons.add_a_photo),title: Text("QR Scanner"),
                  onTap: (){print("napindot");},)
      ],
      ),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             TextField(
               controller: controller,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: 'Enter QR Code'
               ),
             ),
              FlatButton(onPressed: (){
                print("Hello"+controller.text);
                },
                child:Text("Add"),
                color: Colors.amberAccent,
                )
            ],
          ),
        ),
        
      )
    );
  }
}
