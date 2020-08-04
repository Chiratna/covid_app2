import 'package:covid_app/providers/india_covid_data_provider.dart';
import 'package:covid_app/widgets/confirmed_cases.dart';
import 'package:covid_app/widgets/heading_msg.dart';
import 'package:covid_app/widgets/state_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _initState = true;

  @override
  void didChangeDependencies() {
    if (_initState) {
      Provider.of<IndiaCovidDataProvider>(context).getData();
    }
    _initState = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'COVID-19 Tracker',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                HeadingMsgContainer(),
                ConfirmedCases(),
                Container(
                  margin: EdgeInsets.all(24),
                  alignment: Alignment.center,
                  child: Text(
                    'State Distribution',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
            StateItem(),
          ],
        ));
  }
}
