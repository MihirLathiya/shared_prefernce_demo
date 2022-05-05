import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'Text.dart';

class Header extends StatelessWidget {
  final text;
  const Header({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/light-1.png'),
              Image.asset('assets/images/light-2.png'),
              Column(
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  Image.asset(
                    'assets/images/clock.png',
                  ),
                ],
              ),
            ],
          ),
          Ts(
            text: text,
            size: 48.0,
            color: Colors.white,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
