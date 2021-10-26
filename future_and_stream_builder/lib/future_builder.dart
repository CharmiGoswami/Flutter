import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Future_Builder extends StatefulWidget {
  const Future_Builder({Key? key}) : super(key: key);

  @override
  _Future_BuilderState createState() => _Future_BuilderState();
}

class _Future_BuilderState extends State<Future_Builder> {
  int _counter = 0;
  late Future<int?> _value;
  void initState() {
    super.initState();
    _value = _getCounterValue(); //future builder
  }

  void _incrementCounter() async {
    int? newCounter = await _getCounterValue();
    print('$newCounter');

    setState(() {
      _counter++;
    });
  }

  Future<int?> _getCounterValue() async {
    await Future.delayed(Duration(seconds: 5));
    _counter++;
    return _counter;
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Builder'),
      ),
      body: FutureBuilder<int?>(
        future: _getCounterValue(), //_value
        builder: (BuildContext context, AsyncSnapshot<int?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              return Center(
                child: Text('${snapshot.data}'),
              );
            } else {
              return Center(
                child: Text('No data'),
              );
            }
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
