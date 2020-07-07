import 'package:flutter/material.dart';

import 'package:qrscan/qrscan.dart' as scanner;

TextEditingController outputController;

class QRReaderPage extends StatefulWidget {
  @override
  _QRReaderPageState createState() => _QRReaderPageState();
}

class _QRReaderPageState extends State<QRReaderPage> {
  var outputController = new TextEditingController();
  Future _scan() async {
    String barcode = await scanner.scan();
    outputController.text = barcode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            child: Text("Scann"),
            color: Colors.blue,
            onPressed: () {
              setState(() {
                _scan();
              });
            },
          ),
          Container(child: Text("Tesdjfjd")),
        ],
      ),
    );
  }
}

///fdkfdkfk
