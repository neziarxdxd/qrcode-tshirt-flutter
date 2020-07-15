import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsAboutMe extends StatefulWidget {
  @override
  _DetailsAboutMeState createState() => _DetailsAboutMeState();
}

class _DetailsAboutMeState extends State<DetailsAboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              Text("Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  )),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  decoration:
                      InputDecoration(border: const OutlineInputBorder())),
              SizedBox(
                height: 30.0,
              ),
              Text("Age",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  )),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  maxLength: 3,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(border: const OutlineInputBorder())),
              SizedBox(
                height: 30.0,
              ),
              Text("Where do you live?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  )),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  decoration:
                      InputDecoration(border: const OutlineInputBorder())),
              SizedBox(
                height: 30.0,
              ),
              Text("Tell more about yourself",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  )),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:
                      InputDecoration(border: const OutlineInputBorder())),
            ],
          ),
        ),
      ),
    );
  }
}
