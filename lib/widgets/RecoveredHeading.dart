import 'package:flutter/material.dart';

class RecoveredHeading extends StatelessWidget {
  const RecoveredHeading({
    this.delta,
    this.total,
  });

  final String total, delta;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Recovered',
          style: TextStyle(
            color: Color(0xFF4CD97B),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          '$total',
          style: TextStyle(
            color: Color(0xFF4CD97B),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          '[+$delta]',
          style: TextStyle(
            color: Color(0xFF4CD97B),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
