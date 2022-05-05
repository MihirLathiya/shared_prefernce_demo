import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterRepo {
  static Future<bool> registerUser({Map<String, dynamic>? reqBody}) async {
    Map<String, String> headers = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    http.Response response = await http.post(
        Uri.parse(
            "http://scprojects.in.net/projects/skoolmonk/api_/user/create"),
        body: reqBody,
        headers: headers);

    var result = jsonDecode(response.body);
    print('Register==>>${jsonDecode(response.body)}');
    return result['status'];
  }
}
