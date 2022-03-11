import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/SCREENS/Favariotes/Favariotes.dart';
import 'package:learning_three/SCREENS/Home/methods.dart';
import 'package:learning_three/SCREENS/Home/Home.dart';
import 'package:learning_three/SCREENS/Message/Message.dart';
import 'package:learning_three/SCREENS/Profile/Profile.dart';

import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

const bottomIcon = [
  "assets/icons/Shop Icon.svg",
  "assets/icons/Heart Icon.svg",
  "assets/icons/Chat bubble Icon.svg",
  "assets/icons/User Icon.svg"
];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List currentPage = [Home(), Favariotes(), Message(), Profile()];
List appBarTitles = ["Favariotes", "Messages", "Profile"];

class _HomeScreenState extends State<HomeScreen> {
  Ruler r = Ruler();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    double w = ((s.width - r.getAppropiateWidth(120)) / 5);
    return Scaffold(
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => BottomIcon(index),
          )),
      appBar: current == 0
          ? AppBarHome(r, context)
          : AppBar(
              title: Text(appBarTitles[current - 1]),
            ),
      body: currentPage[current],
    );
  }

  IconButton BottomIcon(index) {
    return IconButton(
        onPressed: () {
          // print("clicked ");
          setState(() {
            current = index;
          });
        },
        icon: Column(
          children: [
            SvgPicture.asset(
              bottomIcon[index],
              color: current == index ? kprimaryColor : Colors.black,
            ),
            Container(
              margin: EdgeInsets.only(top: r.getAppropiateHeight(5)),
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                  color: current == index ? kprimaryColor : Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(r.getAppropiateWidth(6)))),
            )
          ],
        ));
  }
}
