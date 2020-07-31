import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../dbstorage.dart';

// ignore: must_be_immutable
class DetailsAboutMe extends StatefulWidget {
  String name = "";
  String bio = "";
  String faveLanguage = "";

  String tellMeMore = "";

  DetailsAboutMe({this.name, this.bio, this.faveLanguage, this.tellMeMore});
  @override
  _DetailsAboutMeState createState() => _DetailsAboutMeState();
}

class _DetailsAboutMeState extends State<DetailsAboutMe> {
  @override
  void initState() {
    super.initState();
  }

  final nameController = new TextEditingController();
  final bioController = new TextEditingController();
  final faveLanguageController = new TextEditingController();

  final tellMeMoreController = new TextEditingController();
  PersonModel personModel;
  PersonHelper personHelper = new PersonHelper();
  List<PersonModel> listPerson = [];
  @override
  Widget build(BuildContext context) {
    nameController.text = (widget.name == null) ? "" : widget.name;
    bioController.text = (widget.bio == null) ? "" : widget.bio;
    faveLanguageController.text =
        (widget.faveLanguage == null) ? "" : widget.faveLanguage;
    tellMeMoreController.text =
        (widget.tellMeMore == null) ? "" : widget.tellMeMore;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Update Information",
          style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Color(0xFFEFF3FF),
      body: Builder(
        builder: (context) => Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: [
                Text("Name",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                    style: TextStyle(fontFamily: 'Poppins'),
                    controller: nameController,
                    decoration:
                        InputDecoration(border: const OutlineInputBorder())),
                SizedBox(
                  height: 30.0,
                ),
                Text("Bio",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                    style: TextStyle(fontFamily: 'Poppins'),
                    controller: bioController,
                    decoration:
                        InputDecoration(border: const OutlineInputBorder())),
                SizedBox(
                  height: 30.0,
                ),
                Text("Favorite Programming Language",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                    style: TextStyle(fontFamily: 'Poppins'),
                    controller: faveLanguageController,
                    decoration:
                        InputDecoration(border: const OutlineInputBorder())),
                SizedBox(
                  height: 30.0,
                ),
                Text("Tell more about yourself",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                    controller: tellMeMoreController,
                    style: TextStyle(fontFamily: 'Poppins'),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration:
                        InputDecoration(border: const OutlineInputBorder())),
                SizedBox(
                  height: 30.0,
                ),
                ButtonTheme(
                  height: 70,
                  minWidth: 200,
                  /***
                   
        ,
        child: FlatButton.icon(
           ,
            ) 
                    
                   
                   * ** */
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    icon: Icon(Icons.send, color: Colors.white),
                    color: Colors.black87,
                    label: Text(
                      "    Submit",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    onPressed: () async {
                      List<PersonModel> person =
                          await personHelper.getAllPersonDetails();
                      setState(() {
                        listPerson = person;
                      });
                      personModel = PersonModel(
                          pBio: bioController.text,
                          pFavoritePL: faveLanguageController.text,
                          pName: nameController.text,
                          pTellMeMore: tellMeMoreController.text);

                      if (listPerson.length < 1) {
                        personHelper.insertPersonDetails(personModel);
                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Icon(Icons.thumb_up),
                              ),
                              Text("Yay it's now added"),
                            ],
                          ),
                        ));
                      } else {
                        print(listPerson[0].toText());
                        personModel = PersonModel(
                            pId: 1,
                            pBio: bioController.text,
                            pFavoritePL: faveLanguageController.text,
                            pName: nameController.text,
                            pTellMeMore: tellMeMoreController.text);
                        personHelper.updatePersonDetails(personModel);
                        print(listPerson[0].toText());
                        print(listPerson.length);

                        Scaffold.of(context).showSnackBar(new SnackBar(
                          content: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Icon(Icons.thumb_up),
                              ),
                              Text("Yay it's now updated"),
                            ],
                          ),
                        ));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
