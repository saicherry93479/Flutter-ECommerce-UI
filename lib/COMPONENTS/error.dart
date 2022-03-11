import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_three/Utils/Rulers.dart';

class ErrorsW extends StatelessWidget {
  const ErrorsW({
    Key? key,
    required this.errors,
    required this.r,
  }) : super(key: key);

  final List<String> errors;
  final Ruler r;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length,
          (index) => ErrorW(
                r: r,
                error: errors[index],
              )),
    );
  }
}

class ErrorW extends StatelessWidget {
  const ErrorW({
    Key? key,
    required this.r,
    required this.error,
  }) : super(key: key);

  final Ruler r;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Close.svg',
          width: r.getAppropiateWidth(15),
        ),
        SizedBox(
          width: r.getAppropiateHeight(10),
        ),
        Text(
          error,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
