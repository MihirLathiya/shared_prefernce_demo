import 'package:http/http.dart' as http;
import 'package:shared_prefernce_demo/api_route/api_routs.dart';
import 'package:shared_prefernce_demo/model/res/AllUserData.dart';

class AllUserService {
  static Future<AllUserModel?> info() async {
    http.Response response = await http.get(Uri.parse(ApiUrls.info));
    //print('Response ======================= ${response.body}');
    if (response.statusCode == 200) {
      return allUserModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
