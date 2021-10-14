import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      children: List.generate(100, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black54,
            ),
            child:
                //Center(
                //   child: Text(
                //     '$index',
                //     style: TextStyle(
                //         fontSize: 30,
                //         color: Colors.red,
                //         fontWeight: FontWeight.bold),
                //   ),
                // )
                Image.network(
              "https://images.unsplash.com/photo-1566208541068-ffdb5471e9bf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
            ),
          ),
        );
      }),
    ));
  }
}
