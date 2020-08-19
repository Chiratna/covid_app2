import '../services/api_fetch.dart';
import 'package:flutter/material.dart';

class DistrictData with Comparable<DistrictData> {
  String name;
  int cases;
  DistrictData(this.name, this.cases);

  @override
  int compareTo(other) {
    return cases.compareTo(other.cases);
  }
}

class DistricDataProvider with ChangeNotifier {
  List<DistrictData> deacesedDistrictRank = [];
  List<DistrictData> recorvedDistrictRank = [];
  List<DistrictData> confirmedDistrictRank = [];
  bool isFetching = true;

  Future<void> fetch(String name) async {
    isFetching = true;
    Map<String, dynamic> data = await Services().distTry(name);
    deacesedDistrictRank = [];
    recorvedDistrictRank = [];
    confirmedDistrictRank = [];
    data.forEach((key, value) {
      if (value['notes'].toString().isEmpty) {
        confirmedDistrictRank.add(DistrictData(
          key,
          value['confirmed'],
        ));
        deacesedDistrictRank.add(DistrictData(
          key,
          value['deceased'],
        ));
        recorvedDistrictRank.add(DistrictData(
          key,
          value['recovered'],
        ));
      }
    });
    confirmedDistrictRank.sort((a, b) {
      return b.compareTo(a);
    });
    deacesedDistrictRank.sort((a, b) {
      return b.compareTo(a);
    });
    recorvedDistrictRank.sort((a, b) {
      return b.compareTo(a);
    });
    isFetching = false;
    notifyListeners();
  }

  List<DistrictData> get confirmedDistData {
    return confirmedDistrictRank.length > 5
        ? [...confirmedDistrictRank.sublist(0, 5)]
        : [];
  }

  List<DistrictData> get deceasedDistData {
    return deacesedDistrictRank.length > 5
        ? [...deacesedDistrictRank.sublist(0, 5)]
        : [];
  }

  List<DistrictData> get recoveredDistData {
    return recorvedDistrictRank.length > 5
        ? [...recorvedDistrictRank.sublist(0, 5)]
        : [];
  }
}
