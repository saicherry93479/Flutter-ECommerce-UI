import 'package:flutter/material.dart';

import 'package:learning_three/SCREENS/SPLASHSCEEEN/components/SPLASH.dart';
import 'package:learning_three/SCREENS/SPLASHSCEEEN/components/SplashDown.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

List<List> splashes = [
  ["assets/images/splash_1.png"],
  ["assets/images/splash_2.png"],
  ["assets/images/splash_3.png"]
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int current = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Ruler r = Ruler();
    Size s = r.init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Flexible(
                flex: 5,
                child: PageView(
                  padEnds: true,
                  controller: _pageController,
                  pageSnapping: true,

                  onPageChanged: (value) {
                    setState(() {
                      current = value;
                    });
                  },
                  // physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children:
                      List.generate(3, (index) => Slash(r: r, Index: index)),
                ),
              ),
              SplashDown(r: r, current: current, buttonC: _pageController),
            ],
          ),
        ),
      ),
    );
  }
}
