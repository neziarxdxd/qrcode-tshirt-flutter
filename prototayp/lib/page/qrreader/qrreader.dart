import 'package:flutter/material.dart';

class QRReaderPage extends StatefulWidget {
  @override
  _QRReaderPageState createState() => _QRReaderPageState();
}

class _QRReaderPageState extends State<QRReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            child: Text("YEHEY THANK YOU LORD"),
            color: Colors.orange,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
