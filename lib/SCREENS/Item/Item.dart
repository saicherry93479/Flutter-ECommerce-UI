import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/SCREENS/Item/methods.dart';
import 'package:learning_three/SCREENS/Item/models.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

class Item extends StatefulWidget {
  Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Ruler r = Ruler();
  int secondCurrent = 0;
  int firstCurrent = 0;
  int currentCount = 0;
  bool icon = false;
  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    return Scaffold(
      appBar: AppBarI(context, r),
      body: SafeArea(
        child: Container(
          color: ksecondaryColor,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: s.height * 0.3,
                // color: ksecondaryColor,
                child: Center(
                  child: Image(
                    image: AssetImage(
                        itemData[0].photos[firstCurrent][secondCurrent]),
                    width: s.width / 1.5,
                    height: s.height * 0.2,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: r.getAppropiateHeight(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) => ItemItem(s, index))),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(r.getAppropiateWidth(40)),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(top: r.getAppropiateWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: r.getAppropiateWidth(30)),
                        child: Text(
                          itemData[0].heading,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: s.height * 0.06,
                            width: s.width * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(
                                      r.getAppropiateWidth(30))),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  icon = !icon;
                                });
                              },
                              icon: SvgPicture.asset(
                                icon
                                    ? "assets/icons/Heart Icon_2.svg"
                                    : "assets/icons/Heart Icon.svg",
                                color: Colors.red,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: r.getAppropiateWidth(30)),
                        child: Text(
                          itemData[0].subHeading,
                        ),
                      ),
                      SizedBox(
                        height: r.getAppropiateHeight(10),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: r.getAppropiateWidth(30)),
                        child: Text(
                          "See More Details >",
                          style: TextStyle(
                              color: kprimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: r.getAppropiateHeight(10),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ksecondaryColor,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(r.getAppropiateWidth(40))),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: r.getAppropiateWidth(20),
                              vertical: r.getAppropiateWidth(30)),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: List.generate(
                                          2, (index) => ColorsDot(index)),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (currentCount > 0) {
                                              setState(() {
                                                currentCount--;
                                              });
                                            }
                                          },
                                          icon: CircleAvatar(
                                            // radius: 30,
                                            backgroundColor: Colors.white,
                                            child: SvgPicture.asset(
                                                "assets/icons/remove.svg"),
                                          ),
                                        ),
                                        IconButton(
                                          // iconSize: 30,
                                          onPressed: () {
                                            setState(() {
                                              currentCount++;
                                            });
                                          },
                                          icon: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: SvgPicture.asset(
                                              "assets/icons/Plus Icon.svg",
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                              SizedBox(height: r.getAppropiateHeight(40)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Stack(
                                    overflow: Overflow.visible,
                                    children: [
                                      Container(
                                        width: s.width * 0.5,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                r.getAppropiateWidth(30)),
                                        // width: double.infinity,
                                        alignment: Alignment.center,
                                        height: r.getAppropiateHeight(50),
                                        child: const Text(
                                          "Add To Cart",
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
                                      if (currentCount > 0)
                                        Positioned(
                                            right: -10,
                                            top: -10,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: Colors.red,
                                              child: Text(
                                                currentCount.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ))
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ItemItem(Size s, index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          secondCurrent = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: r.getAppropiateWidth(20)),
        height: s.height * 0.06,
        width: s.height * 0.06,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(r.getAppropiateWidth(15)),
            ),
            border: index == secondCurrent
                ? Border.all(width: 1, color: kprimaryColor)
                : Border.all(color: Colors.white)),
        child: Center(
          child: Image(
            height: s.height * 0.04,
            width: s.height * 0.04,
            image: AssetImage(itemData[0].photos[firstCurrent][index]),
          ),
        ),
      ),
    );
  }

  Widget ColorsDot(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          firstCurrent = index;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(right: r.getAppropiateWidth(5)),
        decoration: BoxDecoration(
          color: index == firstCurrent ? Colors.transparent : Colors.white,
          border: index == firstCurrent
              ? Border.all(width: 2, color: kprimaryColor.withOpacity(0.5))
              : Border.all(width: 0, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: itemData[0].colors[index],
            radius: 20,
          ),
        ),
      ),
    );
  }
}
