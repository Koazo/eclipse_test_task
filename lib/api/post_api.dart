import 'dart:convert';

import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/post.dart';
import 'package:http/http.dart' as http;

class PostApi {
  Future<List<Post>> fetchPostsByUserId(var userId) async {
    Map<String, String?> parameters = {
      'userId': userId,
    };

    var uri = Uri.https(Constants.PLACEHOLDER_BASE_URL_DOMAIN,
        Constants.PLACEHOLDER_POSTS_PATH, parameters);
    // var uri = Uri.parse('https://jsonplaceholder.typicode.com/users/1/posts');

    var response = await http.get(uri);

    return List<Post>.from(
        await jsonDecode(response.body).map((x) => Post.fromJson(x)));
  }
}
