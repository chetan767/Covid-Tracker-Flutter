import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var activeScreen;

class BottomBar extends StatelessWidget {
  final current;

  BottomBar({this.current});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80.0),
        child: Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(6),
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: BottomNavigationBar(
              elevation: 5,
              iconSize: 27,
              backgroundColor: Colors.lightBlue,
              unselectedItemColor: Colors.white70,
              selectedItemColor: Colors.white,
              onTap: (current) {
                print(current);
                print(activeScreen);

                if (current == activeScreen) {
                  activeScreen = current;
                  return;
                }
                activeScreen = current;
                switch (current) {
                  case 0:
                    Navigator.pushNamed(context, '/');
                    break;
                  case 1:
                    Navigator.pushNamed(context, '/cases');
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/news');
                    break;
                }
              },
              currentIndex: current,
              // this will be set when a new tab is tapped
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: new Icon(Icons.coronavirus), label: "Cases"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.news_solid), label: 'News')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
