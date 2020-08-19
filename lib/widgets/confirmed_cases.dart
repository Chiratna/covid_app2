import '../providers/india_covid_data_provider.dart';
import './ActiveCaseHeading.dart';
import './DeathHeading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './RecoveredHeading.dart';
import './total_cases_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmedCases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<IndiaCovidDataProvider>(context);
    final stateData = data.totalCount;
    return data.isfetching
        ? Center(
            child: SpinKitWave(
              color: Colors.white,
              size: 23,
            ),
          )
        : Column(
            children: <Widget>[
              TotalCases(
                totalCase: stateData[0],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Row(
                  children: <Widget>[
                    RecoveredHeading(
                      total: stateData[0].recovered,
                      delta: stateData[0].deltarecovered,
                    ),
                    Spacer(),
                    ActiveCaseHeading(
                      total: stateData[0].active,
                    ),
                    Spacer(),
                    DeathHeading(
                      total: stateData[0].deaths,
                      delta: stateData[0].deltadeaths,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
