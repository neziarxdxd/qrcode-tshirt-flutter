import 'package:flutter/material.dart';
import 'db.dart';
import 'taskModel.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget { 
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
  final textController = TextEditingController();
  TaskModel currentTask;
  List <TaskModel>listOFTask=[];
  
  @override
  Widget build(BuildContext context) {
     final TodoHelper _todoHelper = TodoHelper();
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
              controller: textController,
              
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
              Row(crossAxisAlignment: CrossAxisAlignment.stretch,                
                children: <Widget>[
                  Expanded(                    
                    child: RaisedButton(                                  
                      color: Colors.blue,
                      onPressed: () async {
                         currentTask = TaskModel(name: textController.text);
                        _todoHelper.insertTask(currentTask);
                        List<TaskModel> list = await _todoHelper.getAllTask();
                        setState(() {
                          listOFTask = list;
                        });
                      },
                      child: Text("Button"),
                      textColor: Colors.white,                  
                      
                    ),),
                    Expanded(                    
                    child: RaisedButton(                                  
                      color: Colors.blue,
                      onPressed: () async {                        
                      },
                      child: Text("Button"),
                      textColor: Colors.white,                    
                      
                    ),),
                ],
              )
            ,
            Expanded(
              child: ListView.separated(
                  
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Text("${listOFTask[index].id}"),
                      title: Text("${listOFTask[index].name}"),
                      onLongPress: (){print("Gumagana si ${listOFTask[index].id}");},
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: listOFTask.length,

               )) ]
          ),
          
        ),
      ),
      
    );
  }
}
