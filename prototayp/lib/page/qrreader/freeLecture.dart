import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import '../quotePage/quoteMainPage.dart';

TextEditingController outputController;

class FreeLecture extends StatefulWidget {
  @override
  _FreeLectureState createState() => _FreeLectureState();
}

class _FreeLectureState extends State<FreeLecture> {
  void goToQuotePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QuoteMainPage()));
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            setState(() {
              _scan();
            });
          },
          child: Text('Show Flutter homepage'),
        ),
      ),
    );
  }
}
