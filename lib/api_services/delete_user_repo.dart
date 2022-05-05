import 'dart:convert';

import 'package:http/http.dart' as http;

class DeleteUserRepo {
  static Future<bool> deleteUser({Map<String, dynamic>? reqBody}) async {
    // Map<String, String> headers = {
    //   'apiKey': '39712136-9e68-4944-add2-486edfcc8f67',
    //   "content Type": "application/json"
    // };
    http.Response response = await http.post(
      Uri.parse(
          "https://codelineinfotech.com/student_api/User/delete_user.php"),
      body: reqBody,
    );

    var result = jsonDecode(response.body);
    print("Delete===>>>${jsonDecode(response.body)}");
    return result['status'];
  }
}
