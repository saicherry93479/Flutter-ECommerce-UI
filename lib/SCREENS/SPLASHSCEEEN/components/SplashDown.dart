import 'package:flutter/material.dart';
import 'package:learning_three/SCREENS/SPLASHSCEEEN/components/Button.dart';
import 'package:learning_three/SCREENS/SPLASHSCEEEN/components/Dot.dart';
import 'package:learning_three/Utils/Rulers.dart';

class SplashDown extends StatelessWidget {
  SplashDown(
      {Key? key, required this.r, required this.current, required this.buttonC})
      : super(key: key);

  final Ruler r;
  final int current;
  final buttonC;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 3,
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: r.getAppropiateHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Dot(index: index, current: current, r: r),
                ),
              ),
              Spacer(),
              Button(current, r: r, buttonC: buttonC),
              SizedBox(
                height: r.getAppropiateHeight(40),
              )
            ],
          ),
        ));
  }
}
