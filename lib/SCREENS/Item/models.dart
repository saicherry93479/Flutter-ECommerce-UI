import 'package:flutter/material.dart';

class Item {
  late List<Color> colors;
  late List<List<String>> photos;
  late String heading;
  late String subHeading;
  bool liked;
  Item(
      {required this.colors,
      required this.photos,
      required this.heading,
      required this.subHeading,
      required this.liked});
}

List itemData = [
  Item(
      colors: [
        Colors.white,
        Colors.blue,
      ],
      photos: [
        [
          "assets/images/ps4_console_white_1.png",
          'assets/images/ps4_console_white_2.png',
          'assets/images/ps4_console_white_3.png',
          'assets/images/ps4_console_white_4.png'
        ],
        [
          'assets/images/ps4_console_blue_1.png',
          'assets/images/ps4_console_blue_2.png',
          'assets/images/ps4_console_blue_3.png',
          'assets/images/ps4_console_blue_4.png'
        ]
      ],
      heading: "Wireless Controller for PS4",
      subHeading:
          "wireless Controller for PS4 gives you what \n you want in your gaming from over precision \n control your game to sharing",
      liked: true),
];
