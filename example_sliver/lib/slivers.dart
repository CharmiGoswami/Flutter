import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slivers extends StatefulWidget {
  const Slivers({Key? key}) : super(key: key);

  @override
  _SliversState createState() => _SliversState();
}

class _SliversState extends State<Slivers> {
  int index = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Text('Title'),
        flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            "https://cdn.onebauer.media/one/empire-tmdb/films/49519/images/kYY4CKjjknT1GY45ZueZs556Mnl.jpg?format=jpg&quality=80&width=440&ratio=16-9&resize=aspectfill",
            fit: BoxFit.fill,
          ),
          collapseMode: CollapseMode.parallax,
        ),
      ),
      // SliverToBoxAdapter(
      //   child: Column(
      //     children: [
      //       Placeholder(),
      //       Placeholder(),
      //       Placeholder(),
      //     ],
      //   ),
      // ),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              height: 50,
              color: Colors.lightBlue[100 * (index % 5)],
              child: Text('Charmi'),
            ),
          );
        }, childCount: 5),
      ),
      SliverFixedExtentList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
              ),
            );
          }),
          itemExtent: 200),
    ]));
  }
}
