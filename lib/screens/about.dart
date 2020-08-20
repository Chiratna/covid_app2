import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'About',
          style: TextStyle(
              fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Developed By',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Source Sans Pro',
                color: Colors.teal[100],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/icon.jpeg'),
          ),
          Text(
            'Chiratna',
            style: TextStyle(
                fontSize: 40.0,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Source Sans Pro',
                color: Colors.teal[100],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal[200],
              thickness: 3.0,
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.email,
                size: 35.0,
                color: Colors.teal.shade900,
              ),
              title: Text(
                'prinusuva7876@gmail.com',
                style: TextStyle(
                    color: Colors.teal[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Source Sans Pro'),
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            'Data Source - covid19india.org',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Source Sans Pro',
                color: Colors.teal[100],
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
