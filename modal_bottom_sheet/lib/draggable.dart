import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraggebleSheet extends StatefulWidget {
  const DraggebleSheet({Key? key}) : super(key: key);

  @override
  _DraggebleSheetState createState() => _DraggebleSheetState();
}

class _DraggebleSheetState extends State<DraggebleSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Sheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(builder: (__, ScrollController c) {
          return ListView.builder(itemBuilder: (_, int i) {
            controller:
            c;
            return ListTile(
              title: Text(('$i')),
            );
          });
        }),
      ),
    );
  }
}
