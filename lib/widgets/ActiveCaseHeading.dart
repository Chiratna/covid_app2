import 'package:flutter/material.dart';

class ActiveCaseHeading extends StatelessWidget {
  const ActiveCaseHeading({
    this.total,
    this.delta,
  });
  final String total, delta;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Active Cases',
          style: TextStyle(
            color: Color(0xFF4DB5FF),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          '$total',
          style: TextStyle(
            color: Color(0xFF4DB5FF),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
