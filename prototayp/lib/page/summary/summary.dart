import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsAboutMe extends StatefulWidget {
  @override
  _DetailsAboutMeState createState() => _DetailsAboutMeState();
}

class _DetailsAboutMeState extends State<DetailsAboutMe> {
  @override
  final List<TextEditingController> controllers = [];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3FF),
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
                  controller: controllers[0],
                  decoration:
                      InputDecoration(border: const OutlineInputBorder())),
              SizedBox(
                height: 30.0,
              ),
              Text("Profession",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  )),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  maxLength: 25,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(border: const OutlineInputBorder())),
              Text("Bio",
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
              Text("Favorite Programming Language",
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
              SizedBox(
                height: 30.0,
              ),
              ButtonTheme(
                height: 55,
                child: RaisedButton(
                  color: Colors.yellow,
                  child: Text("Submit"),
                  onPressed: () {
                    print("Test" + controllers[0].text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
