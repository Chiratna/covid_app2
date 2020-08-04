import 'dart:convert';

import 'package:covid_app/providers/covidModel.dart';
import 'package:http/http.dart' as http;

class Services {
  CovidIndia covidData;
  final url = 'https://api.covid19india.org/data.json';

  Future<List<Statewise>> fetchJson() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      covidData = covidIndiaFromJson(response.body);

      return covidData.statewise
          .where((element) => int.parse(element.confirmed) > 0)
          .toList();
    } else
      return [];
  }
}
