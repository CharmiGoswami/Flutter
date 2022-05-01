import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_do/ui/screens/account/account.dart';
import 'package:time_do/ui/screens/home_screen.dart';
import 'package:time_do/ui/screens/note/note_home.dart';
import 'package:time_do/ui/screens/recorder/recorder_home.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NoteHome(),
    RecorderHome(),
    Account(),
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
                  ? Icon(Icons.check,color: Colors.white,)
                  : Icon(Icons.check,color: Colors.black,),
              label:_selectedIndex == 0? "To Do" : "",
              backgroundColor: Colors.purple
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Icon(Icons.notes,color: Colors.white,)
                  : Icon(Icons.notes,color: Colors.black,),
              label:_selectedIndex == 1?  "Notes" : "",
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? Icon(Icons.multitrack_audio_rounded,color: Colors.white,)
                  : Icon(Icons.multitrack_audio_rounded,color: Colors.black,),
              label: _selectedIndex == 2 ? "Recoder" : "",
                backgroundColor: Colors.purple
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Icon(Icons.person,color: Colors.white,)
                  : Icon(Icons.person,color: Colors.black,),
              label: _selectedIndex == 3 ?"Account" : "",
                backgroundColor: Colors.purple
            ),
          ],
        ));
  }
}