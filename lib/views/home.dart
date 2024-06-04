import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:universal_covid_tracker/models/wrold_result.dart';
import 'package:universal_covid_tracker/widget/reusable_row.dart';

import '../services/state_services.dart';
import 'countries_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 2), vsync: this)
        ..repeat();
  StateServices _stateServices = StateServices();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Padding(
              padding:
                  const EdgeInsets.only(top: 40.9, left: 17.0, right: 17.0),
              child: FutureBuilder(
                  future: _stateServices.fetchWroldWideData(),
                  builder: (context, AsyncSnapshot<Wroldresult> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.blueGrey,
                            size: 50.0,
                            controller: _controller,
                          ));
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total":
                                  double.parse(snapshot.data!.cases.toString()),
                              "Recoered": double.parse(
                                  snapshot.data!.recovered.toString()),
                              "Death": double.parse(
                                  snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            chartType: ChartType.ring,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.3,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            colorList: colorList,
                            animationDuration:
                                const Duration(milliseconds: 1200),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * .05),
                            child: Card(
                              child: Column(
                                children: [
                                  reusableRow(
                                      value: snapshot.data!.cases.toString(),
                                      title: "Total"),
                                  reusableRow(
                                      value:
                                          snapshot.data!.recovered.toString(),
                                      title: "Rcovered"),
                                  reusableRow(
                                      value: snapshot.data!.deaths.toString(),
                                      title: "Death"),
                                  reusableRow(
                                      value: snapshot.data!.active.toString(),
                                      title: "Active"),
                                  reusableRow(
                                      value: snapshot.data!.critical.toString(),
                                      title: "Critical"),
                                  reusableRow(
                                      value:
                                          snapshot.data!.todayDeaths.toString(),
                                      title: "Today Death"),
                                  reusableRow(
                                      value: snapshot.data!.todayRecovered
                                          .toString(),
                                      title: "Today Recovered"),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CountriesList()));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff1aa260)),
                              child: Center(
                                child: Text('Track Countries'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  })),
        ),
      ),
    );
  }
}
