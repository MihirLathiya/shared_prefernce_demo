import 'package:flutter/material.dart';
import 'package:shared_prefernce_demo/api_services/loginservice.dart';
import 'package:shared_prefernce_demo/model/req/log_in_model.dart';

import 'HomeScreen.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pass = TextEditingController();
    final _email = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                MaterialButton(
                  onPressed: () async {
                    LogInModel model = LogInModel();
                    model.email = _email.text;
                    model.password = _pass.text;
                    model.clientKey = '1595922666X5f1fd8bb5f662';
                    model.deviceType = 'MOB';

                    bool status =
                        await LogInService.loginService(body: model.toJson());

                    if (status == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      Text('Khamo Gadhik');
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
