import 'package:flutter/material.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

class Dot extends StatelessWidget {
  final int index;
  final int current;
  Ruler r;
  Dot({Key? key, required this.index, required this.current, required this.r})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color: index == current
              ? kprimaryColor
              : Color.fromARGB(255, 201, 199, 199),
          borderRadius:
              BorderRadius.all(Radius.circular(r.getAppropiateWidth(6)))),
      height: r.getAppropiateHeight(6),
      width:
          index == current ? r.getAppropiateWidth(30) : r.getAppropiateWidth(6),
      margin: EdgeInsets.only(left: 10),
    );
  }
}
