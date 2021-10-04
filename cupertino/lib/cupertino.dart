import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoWidget extends StatefulWidget {
  const CupertinoWidget({Key? key}) : super(key: key);

  @override
  _CupertinoWidgetState createState() => _CupertinoWidgetState();
}

class _CupertinoWidgetState extends State<CupertinoWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        //backgroundColor: CupertinoColors.systemRed,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino'),
          leading: Icon(CupertinoIcons.add),
          trailing: Icon(CupertinoIcons.infinite),
          brightness: Brightness.light,
          backgroundColor: Colors.amberAccent.withOpacity(0.5),
        ),
        child: Column(
          children: [
            // GestureDetector(
            //   //same as Ink well but we cannot use ink well in cupertino
            //   onTap: () {},
            //   child: Container(
            //     color: Colors.red,
            //   ),
            // ),
            Container(
              height: 100,
            ),
            CupertinoButton(
              child: Text('Cupertino Button'),
              color: Colors.black,
              pressedOpacity: 0.6,
              onPressed: () {},
            ),
            Container(
              height: 20,
            ),
            CupertinoButton.filled(
                child: Text('Alert dialog demo'),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text('Alert dialog'),
                      actions: [
                        CupertinoContextMenuAction(
                          child: Text('Yes'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoContextMenuAction(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CupertinoContextMenu(
                child: Container(
                  color: Colors.redAccent,
                ),
                actions: [
                  CupertinoContextMenuAction(
                    child: Text('Cupertino context menu one'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoContextMenuAction(
                    child: Text('Cupertino context menu two'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
