import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_zone/constant/image_constant.dart';
import 'package:game_zone/screens/addition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: 5.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                  children: [
                    // IconButton(
                    //   icon: SvgPicture.asset(plus),
                    //   onPressed: () {  },
                    //   ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Addition()));
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
