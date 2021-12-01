import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Circle/circle.dart';
import 'package:flutter_application/Home/home.dart';
import 'package:flutter_application/Menu/menu.dart';
import 'package:flutter_application/Notification/notification.dart';
import 'package:flutter_application/Vibes/vibes.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Circle(),
    Vibes(),
    Notifications(),
    Menu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          fixedColor: Colors.white,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? new Image.asset('assets/images/HomeFilled.png')
                  : new Image.asset('assets/images/HomeLine.png'),
              label: "Home",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? new Image.asset('assets/images/Filled.png')
                  : Icon(
                      Icons.bubble_chart_outlined,
                      color: Colors.white,
                    ),
              label: "Circle",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? new Image.asset('assets/images/Lightning.png')
                  : new Image.asset('assets/images/LineLightning.png'),
              label: "Vibes",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? new Image.asset('assets/images/BellFilled.png')
                  : new Image.asset('assets/images/BellLine.png'),
              label: "Notifications",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? new Image.asset('assets/images/MenuFilled.png')
                  : new Image.asset('assets/images/LineMenu.png'),
              label: "More",
              backgroundColor: Colors.black,
            ),
          ],
        ));
  }
}
