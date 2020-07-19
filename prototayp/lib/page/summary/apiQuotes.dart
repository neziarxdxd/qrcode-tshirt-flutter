import 'dart:math';

import 'quotes.dart';

class APIQuotes {
  List<Quotes> _quotes = [
    Quotes("Ang cute ni Raizen", "Raizen"),
    Quotes("Ang cute ni Raizen2", "Raizen2"),
    Quotes("Ang cute ni Raizen3", "Raizen3"),
    Quotes("Ang cute ni Raizen4", "Raizen4"),
    Quotes("Ang cute ni Raizen5", "Raizen5"),
  ];

  int randomNumber = Random().nextInt(5);
  Quotes getQuote() {
    return _quotes[0];
  }
}
