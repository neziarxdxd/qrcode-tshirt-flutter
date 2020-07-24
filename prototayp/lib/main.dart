import 'package:flutter/material.dart';
import 'dbstorage.dart';
import 'page/summary/editInfo.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'page/qrreader/qrreader.dart';
import 'page/quotePage/quoteMainPage.dart';
import 'page/summary/summaryInfos.dart';

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

    QRReaderPage(), // it goes here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3FF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Text(
          'Scan to know me app',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
        )),
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
  PersonModel personModel;
  PersonHelper personHelper = new PersonHelper();
  List<PersonModel> listPerson = [];
  Future<void> goToSummary() async {
    List<PersonModel> person = await personHelper.getAllPersonDetails();
    setState(() {
      listPerson = person;
    });
    print(listPerson[0].toText());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageSummary(
                  name: listPerson[0].pName,
                  bio: listPerson[0].pBio,
                  favoriteLanguage: listPerson[0].pFavoritePL,
                )));
  }

  var outputController = new TextEditingController();
  String qrCodeText;
  Future _scan() async {
    String barcode = await scanner.scan();
    outputController.text = barcode;

    qrCodeText = outputController.text.toString();
    print(qrCodeText);
    if (qrCodeText == "Programmer ako") {
      setState(() {
        qrCodeText = "YEST THANK YOUUU LORD";
        print("YES they are equal");
        goToSummary();
      });
    } else {
      setState(() {
        qrCodeText = "ONE MORE LORD";
      });
    }
  }

  // testing the QR, paki delete nalang kapag okay na
  void testTheQR() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageSummary(
                  name: "Raizen",
                )));
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
              child: Text("Check our Free Lectures"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRReaderPage()));
              },
            ),
            FlatButton(
              child: Text("Go TEST PROFILE PIC"),
              onPressed: () {
                goToSummary();
              },
            )
          ],
        ),
      ),
    );
  }
}
