import 'dart:convert';
import 'dart:developer';
import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<User?>? fetchUsers() async {
    final Uri api = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(api);
    final List<User> users =
        jsonDecode(response.body).map((x) => User.fromJson(x)).toList();
    print(jsonDecode(response.body).runtimeType);

    print(users.first);

    return users;
    // var uri = Uri.https(Constants.PLACEHOLDER_BASE_URL_DOMAIN,
    //     Constants.PLACEHOLDER_USERS_PATH);

    // log('request ${uri.toString()}');

    // var response = await http.get(uri);

    // print('response: ${response.body}');

    // if (response.statusCode == 200) {
    // } else {
    //   throw Exception('Error: ${response.reasonPhrase}');
    // }
  }
}