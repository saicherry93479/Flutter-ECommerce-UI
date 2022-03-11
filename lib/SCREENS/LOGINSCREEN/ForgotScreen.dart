import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_three/COMPONENTS/ButtF.dart';
import 'package:learning_three/COMPONENTS/Methods.dart';
import 'package:learning_three/COMPONENTS/error.dart';
import 'package:learning_three/Utils/Rulers.dart';

const head = [
  "OTP Verification",
  "We sent your code to +91 951 5** ***\n Ths code will expires in 00:30"
];

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  List<String> errors = [];
  Ruler r = Ruler();
  late FocusNode one;
  late FocusNode two;
  late FocusNode three;
  late FocusNode four;
  late TextEditingController oneT;
  late TextEditingController twoT;
  late TextEditingController threeT;
  late TextEditingController fourT;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    one = FocusNode();
    two = FocusNode();
    three = FocusNode();
    four = FocusNode();
    oneT = TextEditingController();
    twoT = TextEditingController();
    threeT = TextEditingController();
    fourT = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    one.dispose();
    two.dispose();
    three.dispose();
    four.dispose();
    oneT.dispose();
    twoT.dispose();
    threeT.dispose();
    fourT.dispose();
  }

  void FocusC(val, s) {
    if (val.length > 0) {
      if (s == "one") {
        print("yes");
        one.unfocus();

        two.requestFocus();
      }
      if (s == 'two') {
        two.unfocus();
        three.requestFocus();
      }
      if (s == "three") {
        three.unfocus();
        four.requestFocus();
      }
      if (s == "four") {
        int a = (oneT.text + twoT.text + threeT.text + fourT.text).length;
        if (a == 4) {
          // Navigator.of(context).pop();
          FocusManager.instance.primaryFocus?.unfocus();
        }
      }
    }
  }

  buttonHandler() {
    int a = (oneT.text + twoT.text + threeT.text + fourT.text).length;
    if (a == 4) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        errors.add("Please Enter Valid OTP");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = r.init(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBarM(context, "OTP Verification"),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: r.getAppropiateHeight(30),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: r.getAppropiateWidth(30)),
                  child: Container(
                    // color: Colors.red,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Header(context, r, head[0], head[1]),
                        Form(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OtpField("one", one, oneT),
                            OtpField("two", two, twoT),
                            OtpField("three", three, threeT),
                            OtpField("four", four, fourT),
                          ],
                        )),
                        Column(
                          children: [
                            errors.isNotEmpty
                                ? ErrorW(r: r, error: errors[0])
                                : const SizedBox(),
                            GestureDetector(
                              onTap: buttonHandler,
                              child: ButtonWidget(
                                r: r,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => ForgotScreen()),
                            );
                          },
                          child: const Text(
                            "Resend OTP Code",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromARGB(255, 83, 83, 83)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: r.getAppropiateHeight(40),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox OtpField(s, FocusNode f, TextEditingController t) {
    return SizedBox(
        width: 70,
        child: TextFormField(
          inputFormatters: [new LengthLimitingTextInputFormatter(1)],
          focusNode: f,
          keyboardType: TextInputType.number,
          controller: t,
          onChanged: (v) {
            FocusC(v, s);
          },
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: BorderOutline(),
              errorBorder: BorderOutline(),
              focusedBorder: BorderOutline()),
        ));
  }

  OutlineInputBorder BorderOutline() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          r.getAppropiateHeight(20),
        ),
      ),
    );
  }
}
