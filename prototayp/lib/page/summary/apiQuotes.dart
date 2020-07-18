import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIQuotes {
  Map data;
  List userData;
  Future getData() async {
    final url =
        'https://raw.githubusercontent.com/zenraiching/web-practice/master/motivate.json';
    http.Response response = await http.get(url);
    data = json.decode(response.body);
    userData = data["data"];
  }
}
