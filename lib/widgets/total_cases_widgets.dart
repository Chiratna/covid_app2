import '../providers/covidModel.dart';
import 'package:flutter/material.dart';

class TotalCases extends StatelessWidget {
  TotalCases({
    this.totalCase,
  });
  final Statewise totalCase;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Total Cases',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${totalCase.confirmed}',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '[+${totalCase.deltaconfirmed}]',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
