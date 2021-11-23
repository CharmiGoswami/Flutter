import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sliver demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: false,
                pinned: true,
                expandedHeight: 150,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Sliver demo',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 30,
                      ),
                    ),
                  ),
                  background: Image.network(
                    "https://ichef.bbci.co.uk/news/640/cpsprodpb/957C/production/_111686283_pic1.png",
                    fit: BoxFit.fill,
                  ),
                  collapseMode: CollapseMode.parallax,
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(labelColor: Colors.black, tabs: [
                    Tab(
                      text: 'Info',
                      icon: new Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      text: 'Edit',
                      icon: new Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      text: 'Profile',
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ),
                pinned: true,
              ),
            ];
          },
          body: const TabBarView(children: [First(), Second(), Third()]),
        ),
      ),
    );
  }
}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Center(
        child: Text(
          'Info',
          style: TextStyle(color: Colors.black, fontSize: 55),
        ),
      ),
    );
  }
}

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: Center(
        child: Text(
          'Edit',
          style: TextStyle(color: Colors.black, fontSize: 55),
        ),
      ),
    );
  }
}

class Third extends StatefulWidget {
  const Third({Key? key}) : super(key: key);

  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 55),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
