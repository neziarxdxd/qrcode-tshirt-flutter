import 'package:flutter/material.dart';

TextEditingController outputController;

class QRReaderPage extends StatefulWidget {
  @override
  _QRReaderPageState createState() => _QRReaderPageState();
}

class _QRReaderPageState extends State<QRReaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Show Flutter homepage'),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://bit.ly/2BO5B9t';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

///fdkfdkfk
