import 'dart:convert';
import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<User>> fetchUsers() async {
    final Uri uri = Uri.https(ConstantsApi.placeholderBaseURLDomain,
        ConstantsApi.placeholderUsersPath);
    final response = await http.get(uri);
    return List<User>.from(
        await jsonDecode(response.body).map((x) => User.fromJson(x)));
  }
}
