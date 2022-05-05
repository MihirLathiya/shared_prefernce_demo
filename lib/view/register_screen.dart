import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_prefernce_demo/api_services/register_repo.dart';
import 'package:shared_prefernce_demo/model/req/register_model.dart';

import 'HomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();
  final _dob = TextEditingController();
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _fName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(hintText: "First Name"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _lName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(hintText: "Last Name"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(hintText: "Email"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _mobile,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(hintText: "Mobile NO"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _dob,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(hintText: "DOB"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _pass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(hintText: "Password"),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _confirmPass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "*required";
                    }
                  },
                  decoration: InputDecoration(hintText: "Confirm Password"),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () async {
                    RegisterModel model = RegisterModel();
                    model.fname = _fName.text;
                    model.lname = _lName.text;
                    model.email = _email.text;
                    model.mobile = _mobile.text;
                    model.dob = _dob.text;
                    model.password = _pass.text;
                    model.confirmPassword = _confirmPass.text;
                    model.clientKey = "1595922666X5f1fd8bb5f662";
                    model.deviceType = "MOB";

                    bool status = await RegisterRepo.registerUser(
                        reqBody: model.toJson());

                    if (status == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      print("Failed");
                    }
                  },
                  color: Colors.teal,
                  child: Text("Register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
