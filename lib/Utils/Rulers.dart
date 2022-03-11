import 'package:flutter/cupertino.dart';

class Ruler {
  late Size _s;
  Size init(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    _s = s;
    return s;
  }

  double getAppropiateHeight(input) {
    return (input) * _s.height / 897.170731707317;
  }

  double getAppropiateWidth(input) {
    return (input) * _s.width / 421.4634146341463;
  }
}
