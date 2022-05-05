import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart  ';

import 'Text.dart';

class AccountList extends StatelessWidget {
  final image;
  final name;
  final onPress;
  AccountList({Key? key, this.image, this.name, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: GestureDetector(
        onTap: onPress,
        child: ListTile(
          leading: SvgPicture.asset(
            image,
            height: 2.h,
            width: 2.h,
          ),
          title: Ts(
            text: name,
            size: 11.sp,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
