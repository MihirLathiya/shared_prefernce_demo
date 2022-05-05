import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefernce_demo/view/Common/Text.dart';
import 'package:shared_prefernce_demo/view/Login_Page.dart';
import 'package:shared_prefernce_demo/view/search_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Ts(
          text: 'HomePage',
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchItems());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  SharedPreferences removeData =
                      await SharedPreferences.getInstance();
                  removeData.remove('Enter Number').then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        ),
                      );
                },
                child: Container(
                  height: 30,
                  width: 80,
                  color: Colors.grey,
                  child: Center(
                    child: Ts(
                      text: 'Log Out',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
