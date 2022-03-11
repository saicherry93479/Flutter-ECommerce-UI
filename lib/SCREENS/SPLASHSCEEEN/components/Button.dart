import 'package:learning_three/SCREENS/LOGINSCREEN/LoginScreen.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:flutter/material.dart';
import 'package:learning_three/Utils/utils.dart';

class Button extends StatelessWidget {
  final int index;

  Button(this.index, {Key? key, required this.r, required this.buttonC})
      : super(key: key);

  final Ruler r;
  PageController buttonC;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: buttonFun,
      onTap: index == 2
          ? () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()))
          : () => buttonC.nextPage(
              duration: Duration(microseconds: 500), curve: Curves.easeIn),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: r.getAppropiateHeight(60),
        child: Text(
          index == 2 ? "Login" : "Continue",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              r.getAppropiateWidth(20),
            ),
          ),
        ),
      ),
    );
  }
}
