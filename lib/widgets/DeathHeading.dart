import 'package:flutter/material.dart';

class DeathHeading extends StatelessWidget {
  const DeathHeading({
    this.total,
    this.delta,
  });

  final String total, delta;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Deceased',
          style: TextStyle(
            color: Color(0xFFFF5959),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          '$total',
          style: TextStyle(
            color: Color(0xFFFF5959),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          '[+$delta]',
          style: TextStyle(
            color: Color(0xFFFF5959),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
