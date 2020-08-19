import 'dart:convert';

import '../providers/covidModel.dart';
import '../providers/stateDailyModel.dart';
import 'package:http/http.dart' as http;

class Services {
  CovidIndia covidData;
  Daily dailyData;
  final url1 = 'https://api.covid19india.org/data.json';
  final url2 = 'https://api.covid19india.org/states_daily.json';
  final url3 = 'https://api.covid19india.org/state_district_wise.json';

  Future<List<Statewise>> fetchJson() async {
    var response = await http.get(url1);

    if (response.statusCode == 200) {
      covidData = covidIndiaFromJson(response.body);

      return covidData.statewise
          .where((element) => int.parse(element.confirmed) > 0)
          .toList();
    } else
      return [];
  }

  Future<List<StatesDaily>> fetchTry() async {
    var response = await http.get(url2);
    if (response.statusCode == 200) {
      dailyData = dailyFromJson(response.body);
      return dailyData.statesDaily;
    } else
      return [];
  }

  Future<Map<String, dynamic>> distTry(String stateName) async {
    var response = await http.get(url3);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      Map<String, dynamic> stateInfo = jsonData[stateName]['districtData'];

      return stateInfo;
    }
    return {};
  }
}
