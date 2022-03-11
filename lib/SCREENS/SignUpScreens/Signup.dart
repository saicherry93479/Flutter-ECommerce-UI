import 'package:flutter/material.dart';
import 'package:learning_three/COMPONENTS/ButtF.dart';
import 'package:learning_three/COMPONENTS/Methods.dart';
import 'package:learning_three/COMPONENTS/Social.dart';
import 'package:learning_three/COMPONENTS/error.dart';

import 'package:learning_three/SCREENS/SignUpScreens/Profile.dart';

import 'package:learning_three/Utils/Rulers.dart';

const icons = ["assets/icons/User Icon.svg", "assets/icons/arrow_right.svg"];

const head = [
  'Register Account',
  "Complete your details or continue \n with social media"
];

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];

  veri(value, s) {
    if (value == null || value.isEmpty) {
      if (errors.contains("$s is not Valid")) {
      } else {
        setState(() {
          errors.add("$s is not Valid");
        });
      }
      return "";
    }
    if (value.isNotEmpty) {
      setState(() {
        errors.remove("$s is not Valid");
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Ruler r = Ruler();
    Size s = r.init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBarM(context, 'Sign Up'),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: r.getAppropiateWidth(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // color: Color.fromARGB(255, 122, 66, 62),
                  child: Header(context, r, head[0], head[1]),
                ),
                SizedBox(
                  height: r.getAppropiateHeight(50),
                ),
                Container(
                  // color: Colors.red,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FieldF(r, context, 'Email', errors, icons[0], veri),
                        FieldF(r, context, "Password", errors, icons[1], veri),
                        FieldF(
                            r, context, "Re-Password", errors, icons[1], veri)
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      errors.isEmpty
                          ? (SizedBox(
                              height: r.getAppropiateHeight(40),
                            ))
                          : (Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ErrorsW(errors: errors, r: r),
                            )),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (errors.isEmpty) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => CompleteProfile()));
                            }
                          }
                        },
                        child: ButtonWidget(
                          r: r,
                        ),
                      ),
                      errors.isEmpty
                          ? SizedBox(
                              height: r.getAppropiateHeight(160),
                            )
                          : SizedBox(
                              height: r.getAppropiateHeight(140),
                            ),
                      Column(
                        children: [
                          Social(r: r),
                          SizedBox(
                            height: r.getAppropiateHeight(30),
                          ),
                          Text(
                            "By continuing your confirm that you agree\n with out Term and Condition",
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
