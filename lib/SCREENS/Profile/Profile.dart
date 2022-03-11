import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

const ProfileData = [
  ["assets/icons/User.svg", 'My Account'],
  ["assets/icons/Bell.svg", 'Notifications'],
  ["assets/icons/Settings.svg", 'Settings'],
  ["assets/icons/Question mark.svg", 'Help Center'],
  ["assets/icons/Log out.svg", 'Log Out'],
];

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  Ruler r = Ruler();

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    return SafeArea(
        child: Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: r.getAppropiateWidth(30)),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: r.getAppropiateHeight(40),
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: r.getAppropiateHeight(60),
                backgroundImage:
                    AssetImage("assets/images/Profile Picture.jpg"),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: kternaryColor,
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                  ))
            ],
          ),
          SizedBox(
            height: r.getAppropiateHeight(30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                List.generate(ProfileData.length, (index) => NotifyItem(index)),
          )
        ],
      ),
    ));
  }

  Widget NotifyItem(index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: r.getAppropiateHeight(14)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: r.getAppropiateHeight(8),
            horizontal: r.getAppropiateWidth(20)),
        tileColor: kternaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r.getAppropiateWidth(20)),
        ),
        leading: SvgPicture.asset(
          ProfileData[index][0],
          width: r.getAppropiateWidth(24),
          height: r.getAppropiateWidth(24),
          color: kprimaryColor.withOpacity(0.6),
        ),
        title: Text(
          ProfileData[index][1],
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black38),
        ),
        trailing: SvgPicture.asset(
          "assets/icons/arrow_right.svg",
          width: r.getAppropiateWidth(18),
          height: r.getAppropiateWidth(18),
          color: Colors.black26,
        ),
      ),
    );
  }
}
