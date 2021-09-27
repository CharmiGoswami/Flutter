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
      backgroundColor: Colors.deepPurple,
      body: Container(
        child: Column(
          children: [
            Row(
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
                Icon(
                  Icons.bubble_chart,
                  color: Colors.green,
                ),
                Text(
                  '234',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.blur_circular_sharp,
                  color: Colors.amber,
                ),
                Text(
                  '543',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.calculate,
                  color: Colors.pink,
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
            Container(
              height: 600,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
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
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bubble_chart_outlined,
              color: Colors.grey,
            ),
            label: "Circle",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bolt_outlined,
              color: Colors.grey,
            ),
            label: "Vibes",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: Colors.grey,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
            ),
            label: "More",
          ),
        ],
      ),
    );
  }
}
