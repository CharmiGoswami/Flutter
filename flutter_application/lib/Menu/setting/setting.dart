import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_class.dart';
import 'other_setting.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Listclass> vibes = [
    Listclass(field: 'Follow Vibes', checked: false),
    Listclass(field: 'Friends Vibes', checked: false),
    Listclass(field: 'Friends Audio Buzz', checked: false),
    Listclass(field: '10% more Yay remain', checked: false),
    Listclass(field: 'Vibe mad to public', checked: false),
  ];
  List<Listclass> circle = [
    Listclass(field: 'New Request', checked: false),
    Listclass(field: 'Invited friend joined', checked: false),
  ];
  List<Listclass> notify = [
    Listclass(field: 'Best', checked: false),
    Listclass(field: 'Close', checked: false),
    Listclass(field: 'Exptend', checked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: ListView(children: [
          Column(children: [
            SizedBox(
              height: 5,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: ClipOval(
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.withOpacity(0.2)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Notify on',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.white))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey.withOpacity(0.2)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Other_Setting()));
                    },
                    child: Text(
                      'Other',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
                  child: Text(
                    'Vibes',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                height: 280,
                child: ListView.builder(
                  itemCount: vibes.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return SwitchListTile(
                      title: Text(
                        '${vibes[index].field}',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: vibes[index].checked,
                      onChanged: (value) {
                        setState(() {
                          vibes[index].checked = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
                  child: Text(
                    'Circle',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                height: 110,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: circle.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SwitchListTile(
                      title: Text(
                        '${circle[index].field}',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: circle[index].checked,
                      onChanged: (value) {
                        setState(() {
                          circle[index].checked = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
                  child: Text(
                    'Notify from',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                height: 170,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: notify.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SwitchListTile(
                      title: Text(
                        '${notify[index].field}',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: notify[index].checked,
                      onChanged: (value) {
                        setState(() {
                          notify[index].checked = value;
                        });
                      },
                    );
                  },
                ),
              ),
            )
          ])
        ]));
  }
}
