import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/Utils/Rulers.dart';

const data = [
  "assets/icons/google-icon.svg",
  "assets/icons/facebook-2.svg",
  "assets/icons/twitter.svg"
];

class Social extends StatelessWidget {
  const Social({
    Key? key,
    required this.r,
  }) : super(key: key);

  final Ruler r;

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(data.length, (index) => Circu(data[index], r)));
  }

  Padding Circu(String s, Ruler r) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 226, 240, 247),
          child: SvgPicture.asset(s)),
    );
  }
}
