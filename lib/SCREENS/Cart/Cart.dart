import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/SCREENS/Cart/methods.dart';
import 'package:learning_three/SCREENS/Home/methods.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  Ruler r = Ruler();

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
              color: kternaryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(r.getAppropiateWidth(40)),
              )),
          child: Wrap(children: [
            SizedBox(
              width: double.infinity,
              height: r.getAppropiateHeight(30),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: r.getAppropiateWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/icons/receipt.svg",
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Add Vochur Code",
                        style: TextStyle(color: Colors.black38, fontSize: 12),
                      ))
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: r.getAppropiateHeight(30),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: r.getAppropiateWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black38, fontSize: 12),
                        text: "Total\n",
                        children: [
                          TextSpan(
                              text: "\$183.76",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16))
                        ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: s.width * 0.4,
                      alignment: Alignment.center,
                      height: r.getAppropiateHeight(50),
                      child: const Text(
                        "Check Out",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            r.getAppropiateWidth(15),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: r.getAppropiateHeight(30),
            ),
          ]),
        ),
      ),
      appBar: AppBarC(context),
      body: SafeArea(
        child:
            Column(children: List.generate(3, (index) => CartItem(s, index))),
      ),
    );
  }

  Widget CartItem(Size s, index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: r.getAppropiateHeight(10)),
      child: Row(
        children: [
          SizedBox(
            width: r.getAppropiateWidth(25),
          ),
          Container(
            width: s.width / 4.5,
            height: s.height * 0.13,
            decoration: BoxDecoration(
              color: ksecondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(r.getAppropiateWidth(20)),
              ),
            ),
            child: Center(
              child: Image(
                width: s.width / 4.5,
                fit: BoxFit.contain,
                image: AssetImage(popularData[index][0]),
              ),
            ),
          ),
          SizedBox(
            width: r.getAppropiateWidth(20),
          ),
          Container(
            width: s.width * 0.57,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  popularData[index][1],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black54),
                ),
                SizedBox(
                  height: r.getAppropiateHeight(10),
                ),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 16, color: kprimaryColor.withOpacity(0.6)),
                      text: popularData[index][2],
                      children: [
                        TextSpan(
                            text: "x2",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45))
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
