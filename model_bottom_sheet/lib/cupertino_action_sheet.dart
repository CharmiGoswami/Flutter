import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertino_Action extends StatefulWidget {
  const Cupertino_Action({Key? key}) : super(key: key);

  @override
  _Cupertino_ActionState createState() => _Cupertino_ActionState();
}

class _Cupertino_ActionState extends State<Cupertino_Action> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino action'),
      ),
      body: TextButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (_) {
                  return CupertinoActionSheet(
                    title: Text('Select'),
                    cancelButton: CupertinoActionSheetAction(
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        )),
                    actions: [
                      CupertinoActionSheetAction(
                          onPressed: () {}, child: Text('Edit')),
                      CupertinoActionSheetAction(
                          onPressed: () {}, child: Text('Download'))
                    ],
                  );
                });
          },
          child: Text('Press')),
    );
  }
}
