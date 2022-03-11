import 'package:flutter/material.dart';

import 'package:learning_three/COMPONENTS/ButtF.dart';
import 'package:learning_three/COMPONENTS/Methods.dart';

import 'package:learning_three/COMPONENTS/error.dart';
import 'package:learning_three/SCREENS/Home%20Main/HomeScreen.dart';

import 'package:learning_three/SCREENS/LOGINSCREEN/ForgotScreen.dart';
import 'package:learning_three/SCREENS/LOGINSCREEN/methods.dart';

import 'package:learning_three/Utils/Rulers.dart';
import 'package:learning_three/Utils/utils.dart';

const head = [
  'Welcome Back',
  "Complete your details or continue \n with social media"
];
const icons = ["assets/icons/User Icon.svg", "assets/icons/arrow_right.svg"];

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  Ruler r = Ruler();
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  void onChangeCheckBox(newValue) {
    setState(() {
      check = !check;
    });
  }

  veri(value, s) {
    if (value!.isEmpty) {
      if (errors.contains("$s is not Valid")) {
      } else {
        setState(() {
          errors.add("$s is not Valid");
        });
      }
      return "";
    }
    if (value.isNotEmpty) {
      print("in second");
      setState(() {
        errors.remove("$s is not Valid");
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    return Scaffold(
      appBar: AppBarM(context, "Sign In"),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(r.getAppropiateWidth(30)),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: r.getAppropiateHeight(40),
                  ),
                  Header(context, r, head[0], head[1]),
                  SizedBox(
                    height: r.getAppropiateHeight(80),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      FieldF(r, context, "Email", errors, icons[0], veri),
                      FieldF(r, context, "Password", errors, icons[1], veri),
                    ]),
                  ),
                  CheckBoxM(context),
                  errors.isEmpty
                      ? (SizedBox(
                          height: r.getAppropiateHeight(20),
                        ))
                      : (Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ErrorsW(errors: errors, r: r),
                        )),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (errors.isEmpty) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => HomeScreen()),
                              (route) => false);
                        }
                      }
                    },
                    // onTap: buttonFun,

                    child: ButtonWidget(r: r),
                  ),
                  errors.isEmpty
                      ? SizedBox(
                          height: r.getAppropiateHeight(80),
                        )
                      : SizedBox(
                          height: r.getAppropiateHeight(50),
                        ),
                  ScreenBottom(context, r)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row CheckBoxM(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: check,
          onChanged: onChangeCheckBox,
          activeColor: kprimaryColor,
        ),
        Text(
          "Remember me",
          style: Theme.of(context).textTheme.headline4,
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ForgotScreen()));
          },
          child: const Text(
            "Forgot Password",
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color.fromARGB(255, 196, 194, 194)),
          ),
        )
      ],
    );
  }
}
