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
  final TodoHelper _todoHelper = TodoHelper();
  List <TaskModel>listOFTask=[];
  void showData() async{
    List<TaskModel> list = await _todoHelper.getAllTask();
                        setState(() {
                          listOFTask = list;
                        });
  }
  void showDialog(
    
    builder: (BuildContext context){
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("Dialog Content"),
        );
    }
  )

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
        appBar: AppBar(        
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:[
              
              SizedBox(height: 20,),                    
              TextField(obscureText: true,
                decoration: InputDecoration(
                border:OutlineInputBorder(),
                labelText: 'Password'
              ),),
              SizedBox(height: 20,),             
            
            Expanded(
              child: ListView.separated(
                  
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Text("${listOFTask[index].id}"),
                      title: Text("${listOFTask[index].name}"),
                      onLongPress: (){
                        _todoHelper.deleteTask("${listOFTask[index].id}");
                        showData();
                        
                        },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: listOFTask.length,

               )) ]
          ),
          
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Add Note'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.pink,)
    );
  }
}
