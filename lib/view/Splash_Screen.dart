import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefernce_demo/view/HomeScreen.dart';
import 'package:shared_prefernce_demo/view/Login_Page.dart';
import 'package:sizer/sizer.dart';
import 'Common/Text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  var info;
  Future getData() async {
    SharedPreferences get = await SharedPreferences.getInstance();
    var getInfo = get.getString('Enter Number');
    setState(() {
      info = getInfo;
    });
  }

  void initState() {
    getData().whenComplete(
      () => timer = Timer(
        Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => info == null ? LoginPage() : HomePage(),
            ),
          );
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splashLogo.png',
                height: 8.h,
                width: 8.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
