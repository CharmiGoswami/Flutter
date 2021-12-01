import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Menu/setting/setting.dart';
import 'package:flutter_application/Menu/menu.dart';

import 'list_class.dart';

class Other_Setting extends StatefulWidget {
  const Other_Setting({Key? key}) : super(key: key);

  @override
  _Other_SettingState createState() => _Other_SettingState();
}

class _Other_SettingState extends State<Other_Setting> {
  List<Listclass> other_list = [
    Listclass(field: 'Trsto Visible to Circles', checked: false),
    Listclass(field: 'Trsto Visible to Universe', checked: false),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Menu()));
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Setting()));
                    },
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                height: 100,
                child: ListView.builder(
                  itemCount: other_list.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return SwitchListTile(
                      title: Text(
                        '${other_list[index].field}',
                        style: TextStyle(color: Colors.white),
                      ),
                      selected: true,
                      value: other_list[index].checked,
                      onChanged: (value) {
                        setState(() {
                          other_list[index].checked = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ])
        ]));
  }
}
