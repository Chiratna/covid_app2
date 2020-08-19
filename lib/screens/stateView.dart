import '../constant/constants.dart';
import '../providers/covidModel.dart';
import '../providers/distDataProvider.dart';
import '../widgets/ActiveCaseHeading.dart';
import '../widgets/DeathHeading.dart';
import '../widgets/RecoveredHeading.dart';
import '../widgets/custom_case_Button.dart';
import '../widgets/state_note.dart';
import '../widgets/total_cases_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class StateView extends StatefulWidget {
  StateView(this.item);

  final Statewise item;

  @override
  _StateViewState createState() => _StateViewState();
}

class _StateViewState extends State<StateView> {
  bool isConfirmedFocus = true;
  bool isRecoveredFocus = false;
  bool isDeceasedFocus = false;
  @override
  Widget build(BuildContext context) {
    var pData = Provider.of<DistricDataProvider>(context);
    return pData.isFetching
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: SpinKitWave(
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            ],
          )
        : Column(
            children: [
              if (widget.item.statenotes.length > 0)
                StateNote(widget.item.statenotes),
              TotalCases(
                totalCase: widget.item,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                ),
                child: Row(
                  children: <Widget>[
                    RecoveredHeading(
                      total: widget.item.recovered,
                      delta: widget.item.deltarecovered,
                    ),
                    Spacer(),
                    ActiveCaseHeading(
                      total: widget.item.active,
                    ),
                    Spacer(),
                    DeathHeading(
                      total: widget.item.deaths,
                      delta: widget.item.deltadeaths,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, top: 36),
                child: Text(
                  'Top Districts',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              pData.confirmedDistData.length > 0 &&
                      pData.deceasedDistData.length > 0 &&
                      pData.recoveredDistData.length > 0
                  ? Column(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isConfirmedFocus = true;
                                    isDeceasedFocus = false;
                                    isRecoveredFocus = false;
                                  });
                                },
                                child: CustomCaseButton(
                                    isConfirmedFocus, 'Confirmed'),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isConfirmedFocus = false;
                                    isDeceasedFocus = false;
                                    isRecoveredFocus = true;
                                  });
                                },
                                child: CustomCaseButton(
                                    isRecoveredFocus, 'Recovered'),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isConfirmedFocus = false;
                                    isDeceasedFocus = true;
                                    isRecoveredFocus = false;
                                  });
                                },
                                child: CustomCaseButton(
                                    isDeceasedFocus, 'Deceased'),
                              ),
                            ],
                          ),
                        ),
                        if (isConfirmedFocus)
                          ...pData.confirmedDistData.map((element) {
                            return ListTile(
                              title: Text(
                                element.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              trailing: Text(
                                element.cases.toString(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }),
                        if (isRecoveredFocus)
                          ...pData.recoveredDistData.map((element) {
                            return ListTile(
                              title: Text(
                                element.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              trailing: Text(
                                element.cases.toString(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            );
                          }),
                        if (isDeceasedFocus)
                          ...pData.deacesedDistrictRank.map((element) {
                            return ListTile(
                              title: Text(
                                element.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              trailing: Text(
                                element.cases.toString(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.deepPurple,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          })
                      ],
                    )
                  : StateNote(kAlertText),
            ],
          );
  }
}
