import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  AnimationController controller;

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
    return Container(
      width: double.infinity,
      height: 270 * controller.value,
      padding: EdgeInsets.only(left: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF3383CD),
            Color(0xFF11249F),
          ],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(300, 80)),
        image: DecorationImage(
            image: AssetImage(
              "assets/virus.png",
            ),
            alignment: Alignment.topRight,
            fit: BoxFit.fill),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 75.0, bottom: 15),
            child: Image.asset(
              'assets/Drcorona.png',
              width: 180,
              scale: 6,
              alignment: Alignment.topCenter,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              "Know more\n\nabout Covid-19",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ))
        ],
      ),
    );
  }
}
