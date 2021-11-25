import 'dart:convert';
import 'dart:developer';
import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<Users> fetchUsers() async {
    var uri = Uri.https(Constants.PLACEHOLDER_BASE_URL_DOMAIN,
        Constants.PLACEHOLDER_USERS_PATH);

    log('request ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return Users.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }
}
