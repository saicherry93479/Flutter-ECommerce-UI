import 'package:flutter/material.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.r,
  }) : super(key: key);

  final Ruler r;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: r.getAppropiateHeight(60),
      child: const Text(
        "Continue",
        textAlign: TextAlign.center,
        style: TextStyle(
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
    );
  }
}
