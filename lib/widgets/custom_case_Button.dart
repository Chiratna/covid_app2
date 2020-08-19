import 'package:flutter/material.dart';

class CustomCaseButton extends StatelessWidget {
  CustomCaseButton(this.hasFocus, this.title);

  final bool hasFocus;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: hasFocus ? Colors.grey[300] : Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              color: hasFocus ? Colors.black : Colors.white,
              fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
