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
        backgroundColor: Colors.green,
        title: Text("Quotes"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(api.getQuote().quotes.toString()),
              Text(api.getQuote().authors.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
