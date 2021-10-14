import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Model_Buttom extends StatefulWidget {
  const Model_Buttom({Key? key}) : super(key: key);

  @override
  _Model_ButtomState createState() => _Model_ButtomState();
}

class _Model_ButtomState extends State<Model_Buttom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Bottom'),
      ),
      body: TextButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.blue,
              barrierColor: Colors.grey.withOpacity(0.3),
              enableDrag: false,
              isDismissible: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              context: context,
              builder: (_) {
                return SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.download),
                        title: Text('Download'),
                      ),
                      ListTile(
                        leading: Icon(Icons.add),
                        title: Text('Add'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        title: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text('Press')),
    );
  }
}
