import 'package:flutter/material.dart';
import 'dbstorage.dart';

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
  final todoHelper = TodoHelper();
  List<TaskModel> tasks = [];
  TaskModel currentTask;
  final myTextControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Habit Tracker')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: myTextControl,
            ),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  print(myTextControl.text);
                  currentTask = TaskModel(name: myTextControl.text);
                  todoHelper.insertTask(currentTask);
                },
                child: Text("Add")),
            FlatButton(
                color: Colors.green,
                onPressed: () async {
                  List<TaskModel> list = await todoHelper.getAllTask();
                  setState(() {
                    tasks = list;
                  });
                },
                child: Text("Show Task")),
            Expanded(
                child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(tasks[index].name);
                  },
                  onDoubleTap: () {
                    print("nagdouble");
                  },
                  child: Container(
                    height: 100.0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [Text(tasks[index].name)],
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: tasks.length,
            ))
          ],
        ),
      ),
    );
  }
}
