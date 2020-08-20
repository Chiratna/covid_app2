import './about.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/india_covid_data_provider.dart';
import '../widgets/confirmed_cases.dart';
import '../widgets/heading_msg.dart';
import '../widgets/state_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _initState = true;
  TextEditingController searchController;

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
          actions: [
            IconButton(
                icon: Icon(FontAwesomeIcons.user),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => About()));
                })
          ],
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

// Container(
//                   margin: EdgeInsets.all(16),
//                   child: TextField(
//                     controller: searchController,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'Poppins',
//                       fontSize: 23,
//                     ),
//                     decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                           color: Colors.white,
//                         )),
//                         disabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                           color: Colors.white,
//                         )),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                           color: Colors.white,
//                         )),
//                         labelStyle: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Poppins',
//                           fontSize: 20,
//                         ),
//                         labelText: 'Search',
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Colors.white,
//                           size: 30,
//                         )),
//                   ),
//                 ),
