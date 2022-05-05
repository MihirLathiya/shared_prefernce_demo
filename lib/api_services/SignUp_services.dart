import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_prefernce_demo/api_route/api_routs.dart';

class SignUpServices {
  static Future signUp({Map<String, dynamic>? reqBody}) async {
    http.Response sing =
        await http.post(Uri.parse(ApiUrls.signUpUrl), body: reqBody);

    print("Sign Up Response====>> ${jsonDecode(sing.body)}");

    return jsonDecode(sing.body);
  }
}
