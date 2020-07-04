import 'package:flutter/material.dart';
import 'dbstorage.dart';
import 'page/qrreader/qrreader.dart';
import 'page/summary/summary.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownScreenState(),
    );
  }
}

class DropdownScreenState extends StatefulWidget {
  @override
  _DropdownScreenStateState createState() => _DropdownScreenStateState();
}

class _DropdownScreenStateState extends State<DropdownScreenState> {
  final todoHelper = ActivityHelper();

  List<String> dateTime = new DateTime.now().toString().split(" ");
  List<ActivityModel> tasks = [];
  ActivityModel currentTask;
  final myTextControl = new TextEditingController();
  final myDateControl = new TextEditingController();
  Icon thisTestIcon;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> myPage = [QRReaderPage(), SummaryPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Habit Tracker')),
      ),
      body: Center(
        child: myPage[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
      ], currentIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
