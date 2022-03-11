import 'package:flutter/material.dart';
import 'package:learning_three/SCREENS/Home/methods.dart';
import 'package:learning_three/Utils/Rulers.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Ruler r = Ruler();
  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    double w = ((s.width - r.getAppropiateWidth(120)) / 5);
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: r.getAppropiateWidth(30)),
            child: TopOneHome(r),
          ),
          SizedBox(
            height: r.getAppropiateHeight(22),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: r.getAppropiateWidth(30)),
            child: TopTwoHome(w, r),
          ),
          SizedBox(
            height: r.getAppropiateHeight(22),
          ),
          Padding(
            padding: EdgeInsets.only(left: r.getAppropiateWidth(30)),
            child: TopThree(context, s, r),
          ),
          SizedBox(
            height: r.getAppropiateHeight(22),
          ),
          Padding(
            padding: EdgeInsets.only(left: r.getAppropiateWidth(30)),
            child: TopHomeFour(context, s, r),
          )
        ],
      ),
    ));
  }
}
