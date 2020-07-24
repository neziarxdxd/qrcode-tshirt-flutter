import 'package:flutter/material.dart';

class PageSummary extends StatefulWidget {
  final String name;
  final String bio;
  final String tellMeMore;
  final String favoriteLanguage;

  const PageSummary(
      {Key key, this.name, this.bio, this.tellMeMore, this.favoriteLanguage})
      : super(key: key);
  @override
  _PageSummaryState createState() => _PageSummaryState();
}

class _PageSummaryState extends State<PageSummary> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Profile'),
      ),
      body: Container(
        child: ListView(
          children: [
            Text("TEST: in jesus name" + widget.name),
            Text("fdkldkf"),
            Text("Bio"),
            Text("dfddf"),
            Text("dfdfd"),
            Text("Gdkfdkfkd")
          ],
        ),
      ),
    );
  }
}
