import 'package:flutter/material.dart';
import 'package:learning_three/COMPONENTS/Social.dart';
import 'package:learning_three/SCREENS/SignUpScreens/Signup.dart';
import 'package:learning_three/Utils/utils.dart';

Container ScreenBottom(BuildContext context, r) {
  return Container(
    // color: Colors.red,
    padding: EdgeInsets.symmetric(vertical: r.getAppropiateHeight(40)),
    // width: double.infinity,

    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Social(r: r),
        SizedBox(
          height: r.getAppropiateHeight(30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SignUp()));
              },
              child: Text("Sign Up",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kprimaryColor)),
            )
          ],
        ),
      ],
    ),
  );
}
