import 'package:flutter/material.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                "Name",
              ),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'Hint Text',
                      border: const OutlineInputBorder())),
            ],
          ),
        ),
      ),
    );
  }
}
