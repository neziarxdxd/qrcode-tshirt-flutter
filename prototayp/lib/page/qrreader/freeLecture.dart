import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

TextEditingController outputController;

class FreeLecture extends StatefulWidget {
  @override
  _FreeLectureState createState() => _FreeLectureState();
}

class _FreeLectureState extends State<FreeLecture> {
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
    const url = 'https://bit.ly/PATshirt';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
