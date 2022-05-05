import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefernce_demo/api_services/SignUp_services.dart';
import 'package:shared_prefernce_demo/model/req/SignUp_Model.dart';
import 'package:shared_prefernce_demo/view/HomeScreen.dart';
import 'package:shared_prefernce_demo/view/Login_Page.dart';
import 'package:sizer/sizer.dart';
import 'Common/Text.dart';
import 'Common/TextButton.dart';
import 'Common/TextFeild.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showPassword = true;
  final firsName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  File? _image;
  final picker = ImagePicker();

  Future setImage() async {
    var selectImage = await picker.getImage(source: ImageSource.gallery);

    setState(
      () {
        _image = File(selectImage!.path);
      },
    );
  }

  Future uplodImage({String? fileName}) async {
    dio.FormData formData = dio.FormData.fromMap(
      {
        'avatar':
            await dio.MultipartFile.fromFile(_image!.path, filename: fileName)
      },
    );
    dio.Response response = await dio.Dio().post(
      'https://codelineinfotech.com/student_api/User/user_avatar_upload.php',
      data: formData,
    );

    return response.data['url'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      setImage();
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey,
                    child: _image == null
                        ? Icon(Icons.camera)
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  height: 100,
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
                                    hintText: 'First Name',
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
                                    controller: firsName,
                                  ),
                                  Divider(),
                                  TsField(
                                    length: 10,
                                    color: Colors.white,
                                    hintText: 'Last Name',
                                    prefixIcon: Icons.person,
                                    obText: false,
                                    borderColor: Colors.white,
                                    borderRadius: 0.0,
                                    focusBorderRadius: 0.0,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Phone Number';
                                      }
                                    },
                                    controller: lastName,
                                  ),
                                  Divider(),
                                  TsField(
                                    length: 10,
                                    color: Colors.white,
                                    hintText: 'UserName',
                                    prefixIcon: Icons.lock,
                                    obText: false,
                                    borderColor: Colors.white,
                                    borderRadius: 0.0,
                                    focusBorderRadius: 0.0,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter UserName';
                                      }
                                    },
                                    suffixTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    controller: userName,
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
                                    controller: password,
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
                                String uri = await uplodImage(
                                    fileName:
                                        '${DateTime.now()}${Random().nextInt(10000)}${_image!.path}');

                                SharedPreferences _setData =
                                    await SharedPreferences.getInstance();
                                _setData.setString(
                                    'Enter Number', lastName.text);
                                SignUpReqModel _req = SignUpReqModel();
                                _req.firstName = firsName.text;
                                _req.lastName = lastName.text;
                                _req.username = userName.text;
                                _req.password = password.text;
                                _req.avatar = '$uri';
                                SignUpServices.signUp(reqBody: _req.toJson())
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
