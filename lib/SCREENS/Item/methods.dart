import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

AppBar AppBarI(BuildContext context, Ruler r) {
  return AppBar(
    backgroundColor: ksecondaryColor,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 17,
        child: SvgPicture.asset(
          "assets/icons/Back ICon.svg",
          color: Color.fromARGB(255, 48, 47, 47),
          width: 10,
        ),
      ),
    ),
    actions: [
      Container(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: r.getAppropiateWidth(10),
                vertical: r.getAppropiateWidth(5)),
            margin: EdgeInsets.only(right: r.getAppropiateWidth(20)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(r.getAppropiateWidth(13))),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '4.8',
                  style: TextStyle(color: Colors.black87, fontSize: 10),
                ),
                SizedBox(
                  width: r.getAppropiateWidth(3),
                ),
                SvgPicture.asset(
                  "assets/icons/Star Icon.svg",
                  color: Color.fromARGB(255, 218, 196, 2),
                  width: 16,
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
