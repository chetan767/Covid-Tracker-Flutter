import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:provider/provider.dart';
import 'package:tracker/LaunchUrl.dart';
import 'package:tracker/data/CovidData.dart';
import 'package:tracker/models/CovidGlobe.dart';
import 'package:tracker/widgets/BottomBar.dart';
import 'package:tracker/widgets/CaseUpdate.dart';
import 'package:tracker/widgets/TopBar.dart';

const _url = 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.search,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomBar(
          current: 0,
        ),
        body: FutureBuilder<List<Countries>>(
          future: Provider.of<CovidData>(context).getGlobe(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("yes");

              return buildContainer(snapshot.data, context);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Container buildContainer(List<Countries> countries, BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await LaunchUrl().launchURL(_url);
              },
              child: TopBar(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "World Cases Update",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CaseUpdate(
                  text: "New Confirmed",
                  color: Colors.blueAccent,
                  indicator: "left",
                  iconData: FontAwesomeIcons.viruses,
                  cases: countries.first.todayCases,
                ),
                CaseUpdate(
                  text: "New Deaths",
                  color: Colors.redAccent,
                  indicator: "left",
                  iconData: FontAwesomeIcons.skullCrossbones,
                  cases: countries.first.todayDeaths,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CaseUpdate(
                  text: "Cases Per Million",
                  color: Colors.greenAccent,
                  indicator: "left",
                  iconData: FontAwesomeIcons.viruses,
                  cases: countries.first.casesPerOneMillion,
                ),
                CaseUpdate(
                  text: "Active Cases",
                  color: Colors.orangeAccent,
                  indicator: "left",
                  iconData: FontAwesomeIcons.headSideMask,
                  cases: countries.first.active,
                )
              ],
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              width: 250,
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.all(Radius.elliptical(100, 90))),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/recovery',
                      arguments: (countries.first));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Visualize Cases",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowAltCircleRight,
                      color: Colors.white,
                      size: 21,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
