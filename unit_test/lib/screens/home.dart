import 'package:flutter/cupertino.dart';
import 'package:unit_test/util/time_helper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image:
                AssetImage('assets/images/${TimeHelper.getTimeOfDay()}.jpeg'),
            fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            'Good ${TimeHelper.getTimeOfDay()}',
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
