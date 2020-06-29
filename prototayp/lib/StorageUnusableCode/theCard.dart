import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TheCards extends StatelessWidget {
  final String name;
  final Color color;
  final String habitName;
  TheCards(this.name, this.color, this.habitName);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      child: Padding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.account_circle),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                habitName, // add the Habit here
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            new LinearPercentIndicator(
              width: 200.0,
              lineHeight: 8.0,
              animationDuration: 2000,
              animation: true,
              percent: 0.9,
              progressColor: color,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
      ),
    );
  }
}
