import '../providers/chartDataProvider.dart';
import '../widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({
    this.stateCode,
  });

  final String stateCode;

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = true;
  bool inItState = true;
  // @override
  // void didChangeDependencies() {
  //   if (inItState) {
  //     Provider.of<ChartDataProvider>(context, listen: true)
  //         .fetch()
  //         .then((value) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     });
  //   }
  //   inItState = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    var pData = Provider.of<ChartDataProvider>(context);
    return pData.isFetching
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Text(
                'Spred Trends',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 25,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: 32,
                  left: 16,
                ),
                child: Text(
                  'Confirmed Cases',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                height: 320,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: CustomChart(pData.confirmedChartData),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: 32,
                  left: 16,
                ),
                child: Text(
                  'Recovered Cases',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                height: 320,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: CustomChart(
                  pData.recoveredChartData,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: 32,
                  left: 16,
                ),
                child: Text(
                  'Deaths',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                height: 320,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: CustomChart(
                  pData.deceasedChartData,
                ),
              ),
            ],
          );
  }
}
