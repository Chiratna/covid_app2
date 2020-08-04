import 'package:covid_app/providers/covidModel.dart';
import 'package:covid_app/providers/india_covid_data_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/ActiveCaseHeading.dart';
import '../widgets/DeathHeading.dart';
import '../widgets/RecoveredHeading.dart';
import 'package:flutter/material.dart';

class StateItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<IndiaCovidDataProvider>(context);
    final stateData = data.stateList;
    return data.isfetching
        ? SliverList(
            delegate: SliverChildListDelegate([
            Center(
              child: Container(
                  margin: EdgeInsets.all(16),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  )),
            )
          ]))
        : SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Colors.white,
                          offset: Offset(0, 4),
                          spreadRadius: 8)
                    ]),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: Text(
                        '${stateData[(index + 1)].state}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${stateData[(index + 1)].confirmed}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Text(
                        '[+${stateData[index + 1].deltaconfirmed}]',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        RecoveredHeading(
                          total: stateData[index + 1].recovered,
                          delta: stateData[index + 1].deltarecovered,
                        ),
                        Spacer(),
                        ActiveCaseHeading(
                          total: stateData[index + 1].active,
                        ),
                        Spacer(),
                        DeathHeading(
                          total: stateData[index + 1].deaths,
                          delta: stateData[index + 1].deltadeaths,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }, childCount: stateData.length - 1),
          );
  }
}
