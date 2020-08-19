import 'package:covid_app/providers/chartDataProvider.dart';
import 'package:covid_app/providers/distDataProvider.dart';
import 'package:covid_app/providers/stateDailyModel.dart';

import './providers/india_covid_data_provider.dart';
import './screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndiaCovidDataProvider()),
        ChangeNotifierProvider(
          create: (context) => ChartDataProvider(),
        ),
        ChangeNotifierProvider(create: (context) => DistricDataProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
