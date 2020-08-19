//import 'package:covid_app/providers/stateDetailsModel.dart';
import './stateDailyModel.dart';
import '../services/api_fetch.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Data {
  DateTime date;
  int value;

  Data({
    this.date,
    this.value,
  });
}

class ChartDataProvider with ChangeNotifier {
  List<StatesDaily> lists = [];
  bool isFetching = true;
  List<StatesDaily> confirmed = [];
  List<StatesDaily> recovered = [];
  List<StatesDaily> death = [];
  List<Data> lineData1 = [];
  List<Data> lineData2 = [];
  List<Data> lineData3 = [];
  List<charts.Series<Data, DateTime>> confirmedData = [];
  List<charts.Series<Data, DateTime>> recoveredData = [];
  List<charts.Series<Data, DateTime>> deceasedData = [];
  Future<Map<String, List<StatesDaily>>> fetch(String st) async {
    lists = await Services().fetchTry();
    confirmed =
        lists.where((element) => element.status == Status.CONFIRMED).toList();
    confirmed = confirmed.sublist(confirmed.length - 30);

    death =
        lists.where((element) => element.status == Status.DECEASED).toList();
    death = death.sublist(death.length - 30);
    recovered =
        lists.where((element) => element.status == Status.RECOVERED).toList();
    recovered = recovered.sublist(recovered.length - 30);
    createConfirmData(st);
    isFetching = false;
    print('fetching');
    print(st);
    notifyListeners();
  }

  void createConfirmData(String st) {
    lineData1 = [];
    lineData2 = [];
    lineData3 = [];
    confirmedData = [];
    recoveredData = [];
    deceasedData = [];
    for (int i = 0; i < confirmed.length; i++) {
      lineData1.add(Data(
          date: DateTime.now().subtract(Duration(days: 30 - i)),
          value: int.parse(confirmed[i].stateDetails[st.toLowerCase()])));
    }
    for (int i = 0; i < recovered.length; i++) {
      lineData2.add(Data(
          date: DateTime.now().subtract(Duration(days: 30 - i)),
          value: int.parse(recovered[i].stateDetails[st.toLowerCase()])));
    }
    for (int i = 0; i < death.length; i++) {
      lineData3.add(Data(
          date: DateTime.now().subtract(Duration(days: 30 - i)),
          value: int.parse(death[i].stateDetails[st.toLowerCase()])));
    }
    confirmedData.add(charts.Series(
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
      data: lineData1,
      id: 'D',
      domainFn: (Data data, _) => data.date,
      measureFn: (Data data, _) => data.value,
    ));
    recoveredData.add(charts.Series(
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
      data: lineData2,
      id: 'R',
      domainFn: (Data data, _) => data.date,
      measureFn: (Data data, _) => data.value,
    ));
    deceasedData.add(charts.Series(
      colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.deepPurple),
      data: lineData3,
      id: 'D',
      domainFn: (Data data, _) => data.date,
      measureFn: (Data data, _) => data.value,
    ));
  }

  List<charts.Series<Data, DateTime>> get confirmedChartData {
    return [...confirmedData];
  }

  List<charts.Series<Data, DateTime>> get recoveredChartData {
    return [...recoveredData];
  }

  List<charts.Series<Data, DateTime>> get deceasedChartData {
    return [...deceasedData];
  }
}
