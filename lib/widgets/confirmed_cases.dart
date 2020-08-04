import 'package:covid_app/providers/india_covid_data_provider.dart';
import 'package:covid_app/widgets/ActiveCaseHeading.dart';
import 'package:covid_app/widgets/DeathHeading.dart';
import 'package:covid_app/widgets/RecoveredHeading.dart';
import 'package:covid_app/widgets/total_cases_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmedCases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<IndiaCovidDataProvider>(context);
    final stateData = data.stateList;
    return data.isfetching
        ? Center(
            child: CircularProgressIndicator(),
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
