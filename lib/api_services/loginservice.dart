import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_prefernce_demo/api_route/api_routs.dart';

class LogInService {
  static Future<bool> loginService({Map<String, dynamic>? body}) async {
    Map<String, String> header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0",
      "Client-Service": "frontend-client",
      "User-ID": "1",
      "Auth-Key": "simplerestapi",
      "Content-Type": "application/x-www-form-urlencoded"
    };

    http.Response response =
        await http.post(Uri.parse(ApiUrls.login), body: body, headers: header);

    var result = jsonDecode(response.body);
    print('======>>>> ${jsonDecode(response.body)}');
    return result['status'];
  }
}
