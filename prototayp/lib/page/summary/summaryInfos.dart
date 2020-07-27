import 'package:flutter/material.dart';
import 'editInfo.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsAboutMe(
                              bio: widget.bio,
                              name: widget.name,
                              faveLanguage: widget.favoriteLanguage,
                              tellMeMore: widget.tellMeMore,
                            )));
              },
              icon: Icon(Icons.settings),
            ),
          )
        ],
        backgroundColor: Colors.blue,
        title: Text('My Profile'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ListView(
            children: [
              TextsHeader(widget.name.toString(), "Name:"),
              TextsHeader(widget.bio.toString(), "Bio:"),
              TextsHeader(
                  widget.favoriteLanguage.toString(), "Favorite Language:"),
              TextsHeader(widget.tellMeMore, "About Me: "),
            ],
          ),
        ),
      ),
    );
  }
}

class TextsHeader extends StatefulWidget {
  final String titleContent;
  final String titleHeader;
  const TextsHeader(this.titleContent, this.titleHeader);

  @override
  _TextsHeaderState createState() => _TextsHeaderState();
}

class _TextsHeaderState extends State<TextsHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleHeader,
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w900,
                fontSize: 20.0),
          ),
          Text(widget.titleContent.toString(),
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Poppins",
                  fontSize: 25.0)),
        ],
      ),
    );
  }
}
