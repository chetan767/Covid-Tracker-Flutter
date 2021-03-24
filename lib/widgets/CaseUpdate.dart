import 'package:flutter/material.dart';

import 'CustomIcon.dart';

class CaseUpdate extends StatelessWidget {
  final color;
  final text;
  final indicator;
  final iconData;
  final cases;

  CaseUpdate(
      {this.color, this.text, this.indicator, this.iconData, this.cases});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: indicator == "left"
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  topRight: Radius.circular(40))
              : BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                cases.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: CustomIcon(iconData: iconData),
            )
          ],
        ),
      ),
    );
  }
}
