import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:universal_covid_tracker/widget/reusable_row.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(top: 40.9, left: 17.0, right: 17.0),
          child: Column(
            children: [
              PieChart(
                dataMap: const {
                  "Total": 20,
                  "Recoered": 15,
                  "Death": 5,
                },
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 3.3,
                legendOptions:
                    const LegendOptions(legendPosition: LegendPosition.left),
                colorList: colorList,
                animationDuration: const Duration(milliseconds: 1200),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .05),
                child: Card(
                  child: Column(
                    children: [
                      reusableRow(value: "200", title: "Total"),
                      reusableRow(value: "200", title: "Total"),
                      reusableRow(value: "200", title: "Total"),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff1aa260)),
                  child: Center(child: Text('Track Countries'),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
