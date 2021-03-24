import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tracker/data/CovidData.dart';
import 'package:tracker/models/CovidGlobe.dart';
import 'package:tracker/widgets/BottomBar.dart';
import 'package:tracker/widgets/CustomTile.dart';

class CasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Countries"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(
              FontAwesomeIcons.globe,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(
        current: 1,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: FutureBuilder<List<Countries>>(
            future: Provider.of<CovidData>(context).getGlobe(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Countries> items = snapshot.data;
                items.removeAt(0);
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return customTile(
                        country: items[index],
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
