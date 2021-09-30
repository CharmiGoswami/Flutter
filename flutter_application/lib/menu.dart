import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Trsto',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    '.',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 50,
                    height: 150,
                  ),
                  new Image.asset(
                    'assets/images/Line.png',
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    '234',
                    style: TextStyle(color: Colors.grey),
                  ),
                  new Image.asset(
                    'assets/images/IconV3@3x.png',
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    '543',
                    style: TextStyle(color: Colors.grey),
                  ),
                  new Image.asset(
                    'assets/images/μ.png',
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    '343',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 54,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              ),
            ),
            Container(
              height: 600,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.edit_outlined,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Edit profile',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Setting',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Change Password',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.not_listed_location_outlined,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'FAQs',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.comment_outlined,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Write a feedback',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.sim_card_download_outlined,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Download data',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Log out',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bubble_chart_outlined,
              color: Colors.grey,
            ),
            label: "Circle",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bolt_outlined,
              color: Colors.grey,
            ),
            label: "Vibes",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.grey,
            ),
            label: "Notifications",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            label: "More",
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
