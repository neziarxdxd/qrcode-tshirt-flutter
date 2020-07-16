import 'package:flutter/material.dart';
import 'dbstorage.dart';
import 'page/summary/summary.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'page/qrreader/qrreader.dart';

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

int selectedIndex = 0;

class _DropdownScreenStateState extends State<DropdownScreenState> {
  final todoHelper = PersonHelper();

  List<String> dateTime = new DateTime.now().toString().split(" ");
  List<PersonModel> tasks = [];
  PersonModel currentTask;
  final myTextControl = new TextEditingController();
  final myDateControl = new TextEditingController();
  Icon thisTestIcon;

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> myPage = [
    DetailsAboutMe(),
    QRHome(),
    DetailsAboutMe(),
    DetailsAboutMe(),

    QRReaderPage(), // it goes here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3FF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Scan to know me app')),
      ),
      body: Center(
        child: myPage[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('QR Scan')),
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_video),
              title: Text('Gift'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), title: Text('About Us')),
          ],
          selectedItemColor: Color(0xff28306d),
          unselectedItemColor: Colors.black26,
          currentIndex: selectedIndex,
          onTap: _onItemTapped),
    );
  }
}

class QRHome extends StatefulWidget {
  @override
  _QRHomeState createState() => _QRHomeState();
}

class _QRHomeState extends State<QRHome> {
  var outputController = new TextEditingController();
  String qrCodeText;
  Future _scan() async {
    String barcode = await scanner.scan();
    outputController.text = barcode;

    qrCodeText = outputController.text.toString();
    print(qrCodeText);
    if (qrCodeText == "Programmer Ako") {
      setState(() {
        qrCodeText = "YEST THANK YOUUU LORD";
        print("YES they are equal");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QRReaderPage()));
      });
    } else {
      setState(() {
        qrCodeText = "ONE MORE LORD";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            FlatButton(
              color: Colors.amberAccent,
              child: Text("Scan QR"),
              onPressed: () {
                setState(() {
                  _scan();
                });
              },
            ),
            Text('dsf'),
            FlatButton(
              child: Text("Go to profile"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRReaderPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
