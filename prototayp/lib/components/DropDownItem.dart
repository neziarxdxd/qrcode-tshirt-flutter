import 'package:flutter/material.dart';

class DartDropwItem extends StatefulWidget {
  @override
  _DartDropwItemState createState() => _DartDropwItemState();
}

Item selectedUser;
List<Item> users = <Item>[
  const Item('Androidx', Icon(Icons.android, color: Colors.black26)),
  const Item(
      'Flutter',
      Icon(
        Icons.flag,
        color: Colors.black38,
      )),
];

class _DartDropwItemState extends State<DartDropwItem> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
        hint: Text("Select item"),
        value: selectedUser,
        onChanged: (Item value) {
          setState(() {
            selectedUser = value;
          });
        },
        items: users.map((Item user) {
          return DropdownMenuItem<Item>(
            value: user,
            child: Row(
              children: <Widget>[
                user.icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  user.name,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        }).toList());
  }
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;

  String toData() {
    return "{$icon, $name}";
  }
}
