import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

AppBar AppBarM(BuildContext context, s) {
  return AppBar(
    title: Text(s),
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

Column Header(BuildContext context, Ruler r, String s, String s1) {
  return Column(
    children: [
      Text(
        s,
        style: Theme.of(context).textTheme.headline2,
      ),
      SizedBox(
        height: r.getAppropiateHeight(10),
      ),
      Text(
        s1,
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget FieldF(Ruler r, BuildContext context, String s, errors, icon,
    Function(dynamic value, dynamic s) veri) {
  return Column(
    children: [
      TextFormField(
        validator: (value) {
          if (s == 'Re-Password') {
            veri(value, "Password");
          } else {
            veri(value, s);
          }
        },
        obscureText: (s == "Password" || s == "Re-Password") ? true : false,
        autofocus: false,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorStyle: TextStyle(height: 0),
          // errorText: "",
          // errorStyle: TextStyle(fontSize: 0),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: r.getAppropiateWidth(8)),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                icon,
                color: Color.fromARGB(255, 82, 81, 81),
              ),
            ),
          ),

          contentPadding: EdgeInsets.symmetric(
              horizontal: r.getAppropiateWidth(30),
              vertical: r.getAppropiateHeight(15)),
          hintText: "Enter your $s",
          labelText: " $s ",
          labelStyle: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 196, 194, 194),
              fontWeight: FontWeight.w500),
          hintStyle: Theme.of(context).textTheme.headline4,
          focusedBorder: BorderOutline(color: kprimaryColor, width: 2.5, r: r),
          errorBorder: BorderOutline(color: kprimaryColor, width: 2.5, r: r),
          border: BorderOutline(r: r),
        ),
      ),
      SizedBox(
        height: r.getAppropiateHeight(25),
      ),
    ],
  );
}

OutlineInputBorder BorderOutline({color = Colors.black, width = 1.0, r}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
    borderRadius: BorderRadius.all(
      Radius.circular(
        r.getAppropiateWidth(30),
      ),
    ),
  );
}
