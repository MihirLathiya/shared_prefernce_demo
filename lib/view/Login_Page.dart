import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefernce_demo/view/Common/Text.dart';
import 'package:shared_prefernce_demo/view/HomeScreen.dart';
import 'package:shared_prefernce_demo/view/Signin_Page.dart';
import 'package:sizer/sizer.dart';
import 'Common/Header.dart';
import 'Common/TextButton.dart';
import 'Common/TextFeild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _num = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Header(
                text: 'Login',
              ),
              SizedBox(
                height: 3.h,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          // height: 25.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 20.0,
                                color: Color.fromRGBO(143, 145, 251, 0.2),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TsField(
                                  length: 10,
                                  color: Colors.white,
                                  hintText: 'Enter Number',
                                  prefixIcon: Icons.phone_android,
                                  obText: false,
                                  borderColor: Colors.white,
                                  typeOfKeyboard: TextInputType.number,
                                  borderRadius: 0.0,
                                  focusBorderRadius: 0.0,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter Phone Number';
                                    }
                                  },
                                  controller: _num,
                                ),
                                Divider(),
                                TsField(
                                  color: Colors.white,
                                  hintText: 'Enter Password',
                                  prefixIcon: Icons.lock,
                                  obText: showPassword,
                                  borderColor: Colors.white,
                                  suffixIcon: Icons.remove_red_eye,
                                  suffixColor: Colors.grey,
                                  suffixTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  borderRadius: 0.0,
                                  focusBorderRadius: 0.0,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter Password';
                                    } else if (value.length < 6) {
                                      return 'Password Min 8 Character';
                                    }
                                  },
                                  controller: _pass,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 50.0, top: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: Ts(
                                text: 'Forgot Password ?',
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TsButton(
                          height: 6.h,
                          width: 80.w,
                          btColor: Colors.blue.shade700,
                          text: 'Login',
                          radius: 7.sp,
                          textColor: Colors.white,
                          textSize: 20.0,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              SharedPreferences setData =
                                  await SharedPreferences.getInstance();
                              setData.setString('Enter Number', _num.text).then(
                                    (value) => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Ts(
                              text: "Don't have an Account?",
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInPage(),
                                  ),
                                );
                              },
                              child: Ts(
                                text: 'SignIn',
                                weight: FontWeight.w900,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
