import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar AppBarC(BuildContext context) {
  return AppBar(
    title: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Your Cart\n',
        style: TextStyle(
            fontSize: 18, color: Colors.black45, fontWeight: FontWeight.w500),
        children: const <TextSpan>[
          TextSpan(
              text: '2 items',
              style: TextStyle(fontSize: 13, color: Colors.black26)),
        ],
      ),
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: SvgPicture.asset(
        "assets/icons/Back ICon.svg",
        color: Color.fromARGB(255, 48, 47, 47),
        width: 12,
      ),
    ),
  );
}
