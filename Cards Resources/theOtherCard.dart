import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentageCard extends StatelessWidget {
  final String name;
  final Color color;
  final String habitName;
  PercentageCard(this.name, this.color, this.habitName);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new LinearPercentIndicator(
            width: 300,
            animation: true,
            lineHeight: 50.0,
            animationDuration: 2000,
            percent: 0.9,
            center: Column(
              children: [
                Text(
                  habitName,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
                Text(
                  habitName,
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                ),
              ],
            ),
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
