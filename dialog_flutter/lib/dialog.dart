import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialog_Msg extends StatefulWidget {
  const Dialog_Msg({Key? key}) : super(key: key);

  @override
  _Dialog_MsgState createState() => _Dialog_MsgState();
}

class _Dialog_MsgState extends State<Dialog_Msg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false, //close when touch out side
                      barrierColor: Colors.blue,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Click yes'),
                          titleTextStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          content: Text('Android dialog'),
                          actions: [
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text('No'),
                              onPressed: () {},
                            ),
                          ],
                        );
                      });
                },
                child: Text('Material Dialog')),
            TextButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text('Click yes'),
                          content: Text('IOS dialog'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text('No'),
                              isDestructiveAction: true,
                              onPressed: () {},
                            )
                          ],
                        );
                      });
                },
                child: Text('Cupertino dialog')),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text('Click yes'),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('Hello....It is simple dialog example'),
                            )
                          ],
                        );
                      });
                },
                child: Text('Simple dialog')),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Text('Hellloooooo....'),
                              FlutterLogo(
                                size: 100,
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Text('Custom dialog')),
            TextButton(
                onPressed: () {
                  final snackbar = SnackBar(
                    content: Text('HEY...'),
                    action: SnackBarAction(
                      textColor: Colors.blue,
                      label: 'Ok',
                      onPressed: () {},
                      disabledTextColor: Colors.red,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
                child: Text('SnackBar'))
          ],
        ),
      ),
    );
  }
}
