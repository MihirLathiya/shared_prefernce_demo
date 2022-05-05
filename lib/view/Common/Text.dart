import 'package:flutter/material.dart';

class Ts extends StatelessWidget {
  final text;
  final size;
  final color;
  final weight;
  final height;
  final family;
  final latterSpace;
  final wordSpace;
  final shadowColor;
  Ts(
      {Key? key,
      this.text,
      this.size,
      this.color,
      this.weight,
      this.height,
      this.family,
      this.latterSpace,
      this.wordSpace,
      this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
          letterSpacing: latterSpace,
          wordSpacing: wordSpace,
          fontSize: size,
          fontWeight: weight,
          color: color,
          height: height,
          fontFamily: family),
    );
  }
}
