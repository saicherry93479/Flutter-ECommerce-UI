import 'package:learning_three/SCREENS/SPLASHSCEEEN/SplashScreen.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:flutter/material.dart';

class Slash extends StatelessWidget {
  const Slash({Key? key, required this.r, required this.Index})
      : super(key: key);

  final Ruler r;
  final int Index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "MODRENSS",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "Welcome to Modress.Let\'s shop!",
            style: Theme.of(context).textTheme.headline3,
          ),
          Spacer(),
          Image(
            image: AssetImage(splashes[Index][0]),
            width: r.getAppropiateWidth(300),
          ),
          SizedBox(
            height: r.getAppropiateHeight(30),
          )
        ],
      ),
    );
  }
}
