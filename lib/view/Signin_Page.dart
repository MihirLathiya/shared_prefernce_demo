import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefernce_demo/view/HomeScreen.dart';
import 'package:shared_prefernce_demo/view/Login_Page.dart';
import 'package:sizer/sizer.dart';
import 'Common/Header.dart';
import 'Common/Text.dart';
import 'Common/TextButton.dart';
import 'Common/TextFeild.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool showPassword = true;
  final _name = TextEditingController();
  final _number = TextEditingController();
  final _password = TextEditingController();
  final _cPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Header(
                  text: 'SignIn',
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
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
                                children: [
                                  TsField(
                                    // length: 10,
                                    color: Colors.white,
                                    hintText: 'Name',
                                    prefixIcon: Icons.person,
                                    obText: false,
                                    borderColor: Colors.white,
                                    borderRadius: 0.0,
                                    focusBorderRadius: 0.0,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Name';
                                      }
                                    },
                                    controller: _name,
                                  ),
                                  Divider(),
                                  TsField(
                                    length: 10,
                                    color: Colors.white,
                                    hintText: 'Phone Number',
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
                                    controller: _number,
                                  ),
                                  Divider(),
                                  TsField(
                                    length: 10,
                                    color: Colors.white,
                                    hintText: 'Password',
                                    prefixIcon: Icons.lock,
                                    obText: false,
                                    borderColor: Colors.white,
                                    borderRadius: 0.0,
                                    focusBorderRadius: 0.0,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Password';
                                      }
                                    },
                                    suffixTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    controller: _password,
                                  ),
                                  Divider(),
                                  TsField(
                                    length: 10,
                                    color: Colors.white,
                                    hintText: 'Confirm Password',
                                    prefixIcon: Icons.lock,
                                    obText: false,
                                    borderColor: Colors.white,
                                    borderRadius: 0.0,
                                    focusBorderRadius: 0.0,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Confirm Password';
                                      } else if (_cPass.value !=
                                          _password.value) {
                                        return 'Incorrect Password';
                                      }
                                    },
                                    suffixTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    controller: _cPass,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          TsButton(
                            height: 6.h,
                            width: 80.w,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                SharedPreferences _setData =
                                    await SharedPreferences.getInstance();
                                _setData
                                    .setString('Enter Number', _number.text)
                                    .then(
                                      (value) => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      ),
                                    );
                              }
                            },
                            btColor: Colors.blue.shade700,
                            text: 'SignIn',
                            radius: 7.sp,
                            textColor: Colors.white,
                            textSize: 20.0,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Ts(
                                text: 'Already have a Account ? ',
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Ts(
                                  text: 'SignUp ',
                                  weight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
