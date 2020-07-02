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
  final todoHelper = ActivityHelper();
  List<String> dateTime = new DateTime.now().toString().split(" ");
  List<ActivityModel> tasks = [];
  ActivityModel currentTask;
  final myTextControl = new TextEditingController();
  final myDateControl = new TextEditingController();
  String dropdownValue = 'One';
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
            DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
            TextField(
              controller: myTextControl,
            ),
            TextField(
              controller: myDateControl,
            ),
            FlatButton(
                color: Colors.red,
                onPressed: () {
                  print(myTextControl.text);
                  currentTask = ActivityModel(
                      activityName: myTextControl.text,
                      activityDate: dateTime[0],
                      activityTime: dateTime[1]);

                  todoHelper.insertTask(currentTask);
                },
                child: Text("Add")),
            FlatButton(
                color: Colors.green,
                onPressed: () async {
                  List<ActivityModel> list = await todoHelper.getAllTask();
                  list.forEach((element) {
                    print(element.activityName +
                        " : " +
                        element.activityDate +
                        " -- " +
                        element.activityTime);
                  });
                },
                child: Text("Show Task")),
          ],
        ),
      ),
    );
  }
}
