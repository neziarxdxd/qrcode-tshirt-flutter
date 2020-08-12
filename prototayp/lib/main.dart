import 'package:flutter/material.dart';
import 'dbstorage.dart';
import 'page/summary/editInfo.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'page/qrreader/freeLecture.dart';
import 'page/qrreader/aboutus.dart';
import 'page/summary/summaryInfos.dart';

void main() => runApp(MyApp());

// add comment
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
    QRHome(), // lets add
    FrontPageQuotes(),
    AboutUsPage() // it goes here
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3FF),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
            child: Text(
          'Scan to know me app',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
        )),
      ),
      body: Builder(
        builder: (context) => Center(
          child: myPage[selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.aspect_ratio,
                ),
                title: Text('Scan Me')),
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_incandescent),
              title: Text('Scan Inspired'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text('About Us')),
          ],
          selectedItemColor: Colors.black87,
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
  // this will show the Details after QR
  Future<void> goToSummary() async {
    List<PersonModel> person = await personHelper.getAllPersonDetails();
    setState(() {
      listPerson = person;
    });

    if (person.length < 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailsAboutMe()));
    } else {
      print(listPerson[0].toText());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PageSummary(
                    name: listPerson[0].pName,
                    bio: listPerson[0].pBio,
                    tellMeMore: listPerson[0].pTellMeMore,
                    favoriteLanguage: listPerson[0].pFavoritePL,
                  )));
    }
  }

  var outputController = new TextEditingController();
  String qrCodeText;
  Future _scan() async {
    String barcode = await scanner.scan();
    outputController.text = barcode;

    qrCodeText = outputController.text.toString();
    print(qrCodeText);

    if (qrCodeText == ('bit.ly/ProudProgrammerDeveloper').toString()) {
      setState(() {
        qrCodeText = "YEST THANK YOUUU LORD";
        print("YES they are equal");
        goToSummary();
      });
    } else {
      setState(() {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Icon(Icons.thumb_up),
              ),
              Text(qrCodeText),
            ],
          ),
        ));
      });
    }
  }

  // testing the QR, paki delete nalang kapag okay na

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ButtonTheme(
        height: 70,
        minWidth: 200,
        child: FlatButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: Colors.black87,
            onPressed: () {
              setState(() {
                _scan();
              });
            },
            icon: Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
            label: Text(
              "Scan to know me",
              style: TextStyle(fontFamily: "Poppins", color: Colors.white),
            )),
      )),
    );
  }
}
