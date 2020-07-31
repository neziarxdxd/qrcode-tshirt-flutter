import 'package:flutter/material.dart';
import 'apiQuotes.dart';

class QuoteMainPage extends StatefulWidget {
  @override
  _QuoteMainPageState createState() => _QuoteMainPageState();
}

class _QuoteMainPageState extends State<QuoteMainPage> {
  APIQuotes api = new APIQuotes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Quotes",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ''' "${api.getQuote().quotes.toString()}" ''',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                  Text(
                    api.getQuote().authors.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
