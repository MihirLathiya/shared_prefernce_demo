import 'package:flutter/material.dart';

import 'Text.dart';

class TsButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final height;
  final width;
  final btColor;
  final textSize;
  final textColor;
  final text;
  final textWeight;
  final radius;
  const TsButton(
      {Key? key,
      required this.onTap,
      this.height,
      this.width,
      this.btColor,
      this.textSize,
      this.textColor,
      this.text,
      this.textWeight,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            btColor,
          ),
        ),
        onPressed: onTap,
        child: Ts(
          weight: textWeight,
          text: text,
          size: textSize,
          color: textColor,
        ),
      ),
    );
  }
}
