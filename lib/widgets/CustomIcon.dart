import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final iconData;

  CustomIcon({this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: Colors.white,
    );
  }
}
