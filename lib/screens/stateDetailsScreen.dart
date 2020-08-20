import '../providers/covidModel.dart';
import '../providers/distDataProvider.dart';
import './about.dart';
import './chartScreen.dart';
import './stateView.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../providers/chartDataProvider.dart';

import '../providers/stateDailyModel.dart';

import '../widgets/chart.dart';
import 'package:flutter/material.dart';

class StateDetailsScreen extends StatefulWidget {
  StateDetailsScreen({this.state});

  final Statewise state;
  @override
  _StateDetailsScreenState createState() => _StateDetailsScreenState();
}

class _StateDetailsScreenState extends State<StateDetailsScreen> {
  // List<StatesDaily> confirmed = [];
  // List<StatesDaily> recovered = [];
  // List<StatesDaily> death = [];
  //Map<String, List<StatesDaily>> data;
  int selectedPage = 0;
  String st = '';
  bool inIt = true;
  bool isLoading = true;
  List<Widget> _pages(List<charts.Series<Data, DateTime>> data) => [
        StateView(widget.state),
        ChartScreen(),
      ];

  void setPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  void didChangeDependencies() {
    if (inIt) {
      Provider.of<DistricDataProvider>(context).fetch(widget.state.state);
      Provider.of<ChartDataProvider>(context).fetch(widget.state.statecode);
    }
    inIt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var pData = Provider.of<ChartDataProvider>(context, listen: false);
    List<Widget> pages = _pages(pData.confirmedChartData);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '${widget.state.state}',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(FontAwesomeIcons.user),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => About()));
              })
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: pData.isFetching
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Center(
                          child: SpinKitWave(
                        color: Colors.white,
                        size: 20,
                      )),
                    ),
                  ],
                )
              : pages[selectedPage]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          currentIndex: selectedPage,
          onTap: setPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.listAlt,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.chartLine,
              ),
              title: Text(''),
            ),
          ]),
    );
  }
}
