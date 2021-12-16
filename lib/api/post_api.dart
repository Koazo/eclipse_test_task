import 'dart:convert';

import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/post.dart';
import 'package:http/http.dart' as http;

class PostApi {
  Future<List<Post>> fetchPostsByUserId(var userId) async {
    Map<String, String?> parameters = {
      'userId': userId,
    };

    var uri = Uri.https(ConstantsApi.placeholderBaseURLDomain,
        ConstantsApi.placeholderPostsPath, parameters);

    var response = await http.get(uri);

    return List<Post>.from(
        await jsonDecode(response.body).map((x) => Post.fromJson(x)));
  }
}
