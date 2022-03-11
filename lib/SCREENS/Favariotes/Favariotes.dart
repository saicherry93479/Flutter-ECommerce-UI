import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/SCREENS/Home/methods.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

const favarioteData = [
  [
    "assets/images/Image Popular Product 1.png",
    "WireLess Controller for PS4",
    "\$64.99",
    "liked"
  ],
  [
    "assets/images/Image Popular Product 2.png",
    "Nike Sport White Man Pant",
    "\$22.54",
    "liked"
  ],
  [
    "assets/images/glap.png",
    "Gloves for base ball of polygon shaped",
    "\$19.28",
    "liked"
  ],
  [
    "assets/images/Image Popular Product 3.png",
    "Nike Sport helmet for cycling",
    "\$76.13",
    "liked"
  ],
];

class Favariotes extends StatefulWidget {
  Favariotes({Key? key}) : super(key: key);

  @override
  State<Favariotes> createState() => _FavariotesState();
}

class _FavariotesState extends State<Favariotes> {
  Ruler r = Ruler();
  var fData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fData.addAll(favarioteData);
      // favarioteData.map((e) => fData.add(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(r.getAppropiateWidth(30)),
      child: Wrap(
          runSpacing: r.getAppropiateHeight(20),
          children:
              List.generate(fData.length, (index) => Favoritetem(s, index))),
    ));
  }

  Widget Favoritetem(Size s, index) {
    return Stack(children: [
      Container(
        width: (s.width - r.getAppropiateWidth(90)) / 2,
        // width: s.width / 2.9,
        // width: double.infinity,
        margin: EdgeInsets.only(right: r.getAppropiateWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: (s.width - r.getAppropiateWidth(80)) / 2,
              height: s.height * 0.14,
              decoration: BoxDecoration(
                color: ksecondaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(r.getAppropiateWidth(20)),
                ),
              ),
              child: Center(
                child: Image(
                  width: s.width / 4.5,
                  image: AssetImage(fData[index][0]),
                ),
              ),
            ),
            SizedBox(
              height: r.getAppropiateHeight(10),
            ),
            Text(
              fData[index][1],
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500),
            ),
            Text(fData[index][2],
                style: TextStyle(
                  fontSize: 13,
                  color: kprimaryColor.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      ),
      Positioned(
          child: IconButton(
        onPressed: () {
          setState(() {
            fData.remove(fData[index]);
          });
        },
        icon: SvgPicture.asset(
          "assets/icons/Heart Icon_2.svg",
          color: kprimaryColor,
        ),
      ))
    ]);
  }
}
