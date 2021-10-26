import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Image_load_FutureBuilder extends StatefulWidget {
  const Image_load_FutureBuilder({Key? key}) : super(key: key);

  @override
  _Image_load_FutureBuilderState createState() =>
      _Image_load_FutureBuilderState();
}

class _Image_load_FutureBuilderState extends State<Image_load_FutureBuilder> {
  Future<String?> _future() async {
    await Future.delayed(Duration(seconds: 5));
    return "https://images.unsplash.com/photo-1566208541068-ffdb5471e9bf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image'),
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder<String?>(
          future: _future(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data != null) {
                return Image.network(
                  '${snapshot.data}',
                  width: double.infinity,
                  height: double.infinity,
                );
              } else {
                return Center(
                  child: Text('No data found'),
                );
              }
            } else {
              return SizedBox();
            }
          },
        )
        // InkWell(
        //   onTap: _future,
        //   child: new Image.network(
        //     "https://images.unsplash.com/photo-1566208541068-ffdb5471e9bf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",),
        // ),
        );
  }
}
