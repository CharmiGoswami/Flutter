import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stream_Builder extends StatefulWidget {
  const Stream_Builder({Key? key}) : super(key: key);

  @override
  _Stream_BuilderState createState() => _Stream_BuilderState();
}

class _Stream_BuilderState extends State<Stream_Builder> {
  int _counter = 0;

  StreamController<int> _streamController = StreamController<int>();
  late Stream<int> _stream;
  late StreamSubscription<int> _subscription;
  void initState() {
    super.initState();

    _stream = _streamController.stream;
    // _subscription = _stream.listen((event) {
    //   print('$event');
    // });
    // _stream.listen((event) {
    //   print('$event');
    // });
  }

  void _incrementCounter() async {
    try {
      _counter++;
      _streamController.add(_counter);

      if (_counter >= 10) {
        _streamController.close();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<int?> _getCounterValue() async {
    await Future.delayed(Duration(seconds: 5));
    _counter++;
    return _counter;
  }

  void dispose() {
    _stream.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stream Builder')),
      ),
      body: StreamBuilder(
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Center(child: Text('${snapshot.data}'));
        },
        stream: _stream,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
