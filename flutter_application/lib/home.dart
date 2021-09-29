import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool isSwitch = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.white38,
            ),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Text(
                    'Text your vibes here',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              'Auto Promote to Turso University',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Icon(Icons.info, color: Colors.white),
                      ),
                      Switch(
                          activeColor: Colors.blueAccent,
                          value: isSwitch,
                          onChanged: (value) {
                            setState(() {
                              isSwitch = value;
                            });
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(SnackBar(content: Text('$isSwitch')));
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 15,
                      ),
                      Text(
                        'Choose catagory',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.yellowAccent),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                        width: 15,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Who cares!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 13,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Art',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 13,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Technology',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10,
                        width: 15,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Health n Wellness',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: 15,
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Fitness',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 15,
                      ),
                      Text(
                        'Type vibe',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 15,
                            color: Colors.yellowAccent),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 300,
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Write your idea here',
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 16,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: Text(
                            'Add Image',
                            style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 16,
                                fontStyle: FontStyle.normal),
                          ),
                          icon: Icon(Icons.image_rounded),
                          backgroundColor: Colors.grey[850],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 76,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
