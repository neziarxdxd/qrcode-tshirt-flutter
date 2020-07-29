import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import '../quotePage/quoteMainPage.dart';

TextEditingController outputController;

class FrontPageQuotes extends StatefulWidget {
  @override
  _FrontPageQuotesState createState() => _FrontPageQuotesState();
}

class _FrontPageQuotesState extends State<FrontPageQuotes> {
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
        goToQuotePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonTheme(
          height: 70,
          minWidth: 200,
          child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Colors.amber,
              onPressed: () {
                setState(() {
                  _scan();
                });
              },
              icon: Icon(Icons.add_a_photo),
              label: Text(
                "Scan to get Quote",
                style: TextStyle(fontFamily: "Poppins"),
              )),
        ),
      ),
    );
  }
}
