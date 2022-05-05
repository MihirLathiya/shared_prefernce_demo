import 'package:flutter/material.dart';
import 'package:shared_prefernce_demo/view/register_screen.dart';
import 'package:shared_prefernce_demo/view/HomeScreen.dart';
import 'package:shared_prefernce_demo/view/Splash_Screen.dart';
import 'package:shared_prefernce_demo/view/Login_Page.dart';
import 'package:shared_prefernce_demo/view/Signin_Page.dart';
import 'package:shared_prefernce_demo/view/data.dart';
import 'package:shared_prefernce_demo/view/loin.dart';
import 'package:shared_prefernce_demo/view/post_data.dart';
import 'package:shared_prefernce_demo/view/sign.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInPage(),
        );
      },
    );
  }
}
