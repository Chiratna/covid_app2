import '../providers/chartDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustomChart extends StatelessWidget {
  // List<charts.Series<Data, DateTime>> createListData() {
  //   return [
  //     charts.Series(
  //       colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
  //       data: _data,
  //       id: id,
  //       domainFn: (Data data, _) => data.date,
  //       measureFn: (Data data, _) => data.value,
  //     )
  //   ];
  // }

  CustomChart(this._data);

  final List<charts.Series<Data, DateTime>> _data;

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      _data,
      defaultRenderer: charts.LineRendererConfig(
        includeArea: true,
        includePoints: false,
        stacked: false,
        areaOpacity: 0.3,
      ),
      animate: false,
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
            lineStyle: charts.LineStyleSpec(
              color: charts.Color.black,
            ),
            labelStyle: charts.TextStyleSpec(
              color: charts.ColorUtil.fromDartColor(Colors.white),
              fontFamily: 'Poppins',
            ),
            labelAnchor: charts.TickLabelAnchor.after),
      ),
      domainAxis: charts.DateTimeAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          lineStyle: charts.LineStyleSpec(
            color: charts.Color.black,
          ),
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(Colors.white),
            fontFamily: 'Poppins',
          ),
          labelAnchor: charts.TickLabelAnchor.centered,
          labelJustification: charts.TickLabelJustification.inside,
          labelOffsetFromAxisPx: 8,
        ),
      ),
      flipVerticalAxis: false,
      animationDuration: Duration(seconds: 2),
    );
  }
}
