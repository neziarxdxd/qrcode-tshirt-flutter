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
            TextsHeader(
              widget.name.toString(),
            ),
            TextsHeader(widget.bio.toString()),
            TextsHeader(widget.favoriteLanguage.toString()),
            TextsHeader(widget.tellMeMore),
          ],
        ),
      ),
    );
  }
}

class TextsHeader extends StatefulWidget {
  final String titleHead;
  const TextsHeader(this.titleHead);

  @override
  _TextsHeaderState createState() => _TextsHeaderState();
}

class _TextsHeaderState extends State<TextsHeader> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.titleHead.toString(),
        style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500));
  }
}
