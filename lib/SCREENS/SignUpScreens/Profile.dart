import 'package:flutter/material.dart';
import 'package:learning_three/COMPONENTS/ButtF.dart';
import 'package:learning_three/COMPONENTS/Methods.dart';
import 'package:learning_three/COMPONENTS/error.dart';
import 'package:learning_three/Utils/Rulers.dart';

const head = [
  "Complete Profile",
  "Complete your details or continue\n with social media"
];
const icons = [
  "assets/icons/User Icon.svg",
  "assets/icons/Phone.svg",
  "assets/icons/Location point.svg"
];

class CompleteProfile extends StatefulWidget {
  CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();
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

  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    Ruler r = Ruler();
    Size s = r.init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBarM(context, "Sign Up"),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: r.getAppropiateWidth(30)),
            child: Column(
              children: [
                SizedBox(
                  height: r.getAppropiateHeight(40),
                ),
                Header(context, r, head[0], head[1]),
                SizedBox(
                  height: r.getAppropiateHeight(30),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FieldF(r, context, "First Name", errors, icons[0], veri),
                      FieldF(r, context, "Last Name", errors, icons[0], veri),
                      FieldF(r, context, "Ph Num", errors, icons[1], veri),
                      FieldF(r, context, "Address", errors, icons[2], veri),
                    ],
                  ),
                ),
                errors.isEmpty
                    ? SizedBox(
                        height: r.getAppropiateHeight(20),
                      )
                    : ErrorsW(errors: errors, r: r),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (errors.isEmpty) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CompleteProfile()),
                        );
                      }
                    }
                  },
                  child: ButtonWidget(
                    r: r,
                  ),
                ),
                SizedBox(
                  height: r.getAppropiateHeight(30),
                ),
                Text(
                  "By continuing your confirm that you agree\n with out Term and Condition",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
