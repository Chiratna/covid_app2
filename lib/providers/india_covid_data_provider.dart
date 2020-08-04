import 'package:covid_app/providers/covidModel.dart';
import 'package:covid_app/services/api_fetch.dart';
import 'package:flutter/material.dart';

class IndiaCovidDataProvider with ChangeNotifier {
  IndiaCovidDataProvider();

  List<Statewise> stateWiseData = [];
  bool isfetching = true;

  Future<List<Statewise>> getData() async {
    stateWiseData = await Services().fetchJson();
    isfetching = false;
    notifyListeners();
  }

  List<Statewise> get stateList {
    return [...stateWiseData];
  }
}
