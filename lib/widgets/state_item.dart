import '../providers/covidModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../providers/india_covid_data_provider.dart';
import '../screens/stateDetailsScreen.dart';
import 'package:provider/provider.dart';

import './ActiveCaseHeading.dart';
import './DeathHeading.dart';
import './RecoveredHeading.dart';
import 'package:flutter/material.dart';

class StateItem extends StatelessWidget {
  void nav(BuildContext ctx, Statewise state) {
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (context) => StateDetailsScreen(
              state: state,
            )));
  }

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
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 23,
                  )),
            )
          ]))
        : SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return GestureDetector(
                onTap: () {
                  nav(
                    context,
                    stateData[index],
                  );
                },
                child: Container(
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
                          '${stateData[index].state}',
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
                          '${stateData[index].confirmed}',
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
                          '[+${stateData[index].deltaconfirmed}]',
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
                            total: stateData[index].recovered,
                            delta: stateData[index].deltarecovered,
                          ),
                          Spacer(),
                          ActiveCaseHeading(
                            total: stateData[index].active,
                          ),
                          Spacer(),
                          DeathHeading(
                            total: stateData[index].deaths,
                            delta: stateData[index].deltadeaths,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }, childCount: stateData.length),
          );
  }
}
