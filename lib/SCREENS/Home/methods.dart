import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/SCREENS/Cart/Cart.dart';
import 'package:learning_three/SCREENS/Item/Item.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

const popularData = [
  [
    "assets/images/Image Popular Product 1.png",
    "WireLess Controller for PS4",
    "\$64.99"
  ],
  [
    "assets/images/Image Popular Product 2.png",
    "Nike Sport White Man Pant",
    "\$22.54"
  ],
  [
    "assets/images/glap.png",
    "Gloves for base ball of polygon shaped",
    "\$19.28"
  ],
  [
    "assets/images/Image Popular Product 3.png",
    "Nike Sport helmet for cycling",
    "\$76.13"
  ],
];

List iconsData = [
  ["assets/icons/Flash Icon.svg", "Flash Deal"],
  ["assets/icons/Bill Icon.svg", "Bill"],
  ["assets/icons/Game Icon.svg", "Game"],
  ["assets/icons/Gift Icon.svg", "Daily Gift"],
  ["assets/icons/Discover.svg", "More"]
];

const specialData = [
  ["assets/images/Image Banner 2.png", "Smartphone", "18 Brands"],
  ["assets/images/Image Banner 3.png", "Fashion", "24 Brands"],
];
AppBar AppBarHome(r, context) {
  return AppBar(
    toolbarHeight: 100,
    // backgroundColor: Colors.blue,
    centerTitle: false,
    title:
        // margin: EdgeInsets.only(left: r.getAppropiateWidth(30)),
        Container(
      padding: EdgeInsets.only(left: r.getAppropiateWidth(5)),
      child: TextField(
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
            enabled: false,
            fillColor: Color.fromARGB(255, 240, 240, 240),
            filled: true,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/Search Icon.svg",
                height: 18,
                width: 18,
                fit: BoxFit.contain,
              ),
            ),
            hintText: "Search product",
            contentPadding: EdgeInsets.symmetric(
                vertical: r.getAppropiateHeight(0),
                horizontal: r.getAppropiateWidth(10)),
            border: BorderOutline(r),
            focusedBorder: BorderOutline(r),
            errorBorder: BorderOutline(r)),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Cart()));
        },
        icon: CircleAvatar(
          child: SvgPicture.asset("assets/icons/Cart Icon.svg"),
          backgroundColor: Color.fromARGB(255, 226, 240, 247),
        ),
      ),
      SizedBox(
        width: r.getAppropiateWidth(10),
      ),
      CircleAvatar(
        child: SvgPicture.asset("assets/icons/Bell.svg"),
        backgroundColor: Color.fromARGB(255, 226, 240, 247),
      ),
      SizedBox(
        width: r.getAppropiateWidth(20),
      )
    ],
  );
}

OutlineInputBorder BorderOutline(r) {
  return OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(
        r.getAppropiateHeight(45),
      ),
    ),
  );
}

Container TopOneHome(r) {
  return Container(
    padding: EdgeInsets.all(r.getAppropiateWidth(20)),
    width: double.infinity,
    decoration: BoxDecoration(
        color: const Color(0xFF392582),
        borderRadius:
            BorderRadius.all(Radius.circular(r.getAppropiateWidth(20)))),
    child: const Text.rich(TextSpan(
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
        children: [
          TextSpan(text: "A Summer Surprise\n"),
          TextSpan(text: "Cashback 20%", style: TextStyle(fontSize: 22))
        ])),
  );
}

Row TopTwoHome(double w, r) {
  return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          iconsData.length, (index) => HomeSecondItem(w, index, r)));
}

Container HomeSecondItem(double w, int index, r) {
  return Container(
    margin: EdgeInsets.only(left: r.getAppropiateWidth(10)),
    width: w,
    child: Column(
      children: [
        Container(
          height: w,
          width: w,
          decoration: BoxDecoration(
              color: const Color(0xFFFEE9DA),
              borderRadius:
                  BorderRadius.all(Radius.circular(r.getAppropiateWidth(13)))),
          child: Center(
            child: SvgPicture.asset(iconsData[index][0]),
          ),
        ),
        Text(
          iconsData[index][1],
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 194, 192, 192)),
        )
      ],
    ),
  );
}

Container TopThreeHomeItem(Size s, Ruler r, index) {
  return Container(
    margin: EdgeInsets.only(right: r.getAppropiateWidth(20)),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.all(Radius.circular(r.getAppropiateWidth(20))),
          child: Image(
            width: s.width / 1.6,
            height: r.getAppropiateHeight(120),
            fit: BoxFit.cover,
            image: AssetImage(specialData[index][0]),
          ),
        ),
        Container(
          width: s.width / 1.6,
          height: r.getAppropiateHeight(120),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(r.getAppropiateWidth(20))),
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(r.getAppropiateWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                specialData[index][1],
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                specialData[index][2],
                style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 211, 211, 211),
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Column TopThree(BuildContext context, Size s, Ruler r) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisAlignment: MainAxisAlignment.start,
    children: [
      HomeTop(
        context,
        r,
        "Special for you",
      ),
      SizedBox(
        height: r.getAppropiateHeight(14),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            2,
            (index) => TopThreeHomeItem(s, r, index),
          ),
        ),
      )
    ],
  );
}

Row HomeTop(BuildContext context, Ruler r, s) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        s,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline5,
      ),
      Padding(
        padding: EdgeInsets.only(right: r.getAppropiateWidth(30)),
        child: Text(
          "See More",
          style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.3),
              fontWeight: FontWeight.w500),
        ),
      )
    ],
  );
}

Column TopHomeFour(BuildContext context, Size s, r) {
  return Column(
    children: [
      HomeTop(context, r, 'Popular Product'),
      SizedBox(
        height: r.getAppropiateHeight(14),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              4, (index) => TopHomeFourItem(s, index, r, context)),
        ),
      )
    ],
  );
}

Widget TopHomeFourItem(Size s, index, r, context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => Item()));
    },
    child: Container(
      width: s.width / 2.9,
      margin: EdgeInsets.only(right: r.getAppropiateWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: s.width / 2.9,
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
                image: AssetImage(popularData[index][0]),
              ),
            ),
          ),
          SizedBox(
            height: r.getAppropiateHeight(10),
          ),
          Text(
            popularData[index][1],
            style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w500),
          ),
          Text(popularData[index][2],
              style: TextStyle(
                fontSize: 18,
                color: kprimaryColor.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ))
        ],
      ),
    ),
  );
}
