import './covidModel.dart';
import '../services/api_fetch.dart';
import 'package:flutter/material.dart';

class IndiaCovidDataProvider with ChangeNotifier {
  IndiaCovidDataProvider();

  List<Statewise> stateWiseData = [];
  List<Statewise> filteredState = [];
  bool isfetching = true;

  Future<List<Statewise>> getData() async {
    stateWiseData = await Services().fetchJson();
    isfetching = false;
    notifyListeners();
  }

  List<Statewise> get stateList {
    return List.from(
        stateWiseData.where((element) => element.statecode != 'TT'));
  }

  List<Statewise> get totalCount {
    return [...stateWiseData];
  }
}
