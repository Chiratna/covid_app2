import '../constant/constants.dart';
import 'package:flutter/material.dart';

class HeadingMsgContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 32,
      ),
      height: (size.height - kToolbarHeight) * 0.2,
      decoration: BoxDecoration(
        color: kHeadingContainerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          kHeadingText,
          softWrap: true,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
