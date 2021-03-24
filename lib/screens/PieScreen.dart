import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tracker/models/CovidGlobe.dart';
import 'package:tracker/widgets/CaseUpdate.dart';

class PieScreen extends StatefulWidget {
  @override
  _PieScreenState createState() => _PieScreenState();
}

class _PieScreenState extends State<PieScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Countries country;

  void initialize(Countries countries) {
    country = countries;
  }

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Countries country = ModalRoute.of(context).settings.arguments;
    controller.value == 0 ? initialize(country) : null;

    return Scaffold(
        backgroundColor: Color(0xffBFEFFF),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: PieChart(
                    dataMap: {
                      "deaths": country.deaths.toDouble() * controller.value,
                      "recovered":
                          country.recovered.toDouble() * controller.value,
                      "active": country.active.toDouble(),
                    },
                    ringStrokeWidth: 20,
                    chartRadius: MediaQuery.of(context).size.width /
                        1 *
                        controller.value,
                    animationDuration: Duration(seconds: 1),
                    centerText: "Covid-19",
                    legendOptions: LegendOptions(
                      showLegendsInRow: true,
                      legendPosition: LegendPosition.bottom,
                      showLegends: true,
                      legendTextStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Row(
                  children: [
                    CaseUpdate(
                      text: "Total Cases",
                      color: Colors.blueAccent,
                      indicator: "left",
                      iconData: FontAwesomeIcons.viruses,
                      cases: country.cases,
                    ),
                    CaseUpdate(
                      text: "Total Deaths",
                      color: Colors.redAccent,
                      indicator: "left",
                      iconData: FontAwesomeIcons.skullCrossbones,
                      cases: country.recovered,
                    )
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
