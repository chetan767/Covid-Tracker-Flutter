import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracker/countryCodes.dart';
import 'package:tracker/models/CovidGlobe.dart';

Map codeMap = Codes().inverse(Codes().countryListAlpha2);

class customTile extends StatelessWidget {
  Countries country;

  customTile({this.country});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(55),
          bottomRight: Radius.circular(55),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25)),
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15)),
          child: ListTile(
            tileColor: Colors.blueGrey,
            title: Text(
              country.country,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            trailing: Flag(
              codeMap[country.country] ?? "",
              width: 40,
              height: 20,
              replacement: Icon(
                CupertinoIcons.globe,
                color: Colors.white,
                size: 35,
              ),
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    "${country.todayCases} New Cases",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.arrow_upward_outlined,
                    size: 20,
                    color: Colors.white70,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${country.todayDeaths} New Deaths",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.arrow_upward_outlined,
                    size: 20,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/recovery', arguments: (country));
            },
          ),
        ),
      ),
    );
  }
}
