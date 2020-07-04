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

  List<Widget> myPage = [
    QRReaderPage(),
    SummaryPage(),
    SummaryPage(),
    SummaryPage(),
    SummaryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF7C80BA),
        title: Center(child: Text('Habit Tracker')),
      ),
      body: Center(
        child: myPage[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('Home')),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              title: Text('QR Scan'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), title: Text('Add Activity')),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_play),
              title: Text('Summary Habits'),
            ),
          ],
          selectedItemColor: Color(0xffff9090),
          unselectedItemColor: Colors.black26,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped),
    );
  }
}
