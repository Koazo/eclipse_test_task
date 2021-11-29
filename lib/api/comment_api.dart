import 'dart:convert';

import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentApi {
  Future<List<Comment>> fetchCommentsByPostId(var postId) async {
    Map<String, String?> parameters = {
      'postId': postId,
    };

    var uri = Uri.https(Constants.PLACEHOLDER_BASE_URL_DOMAIN,
        Constants.PLACEHOLDER_COMMENTS_PATH, parameters);

    var response = await http.get(uri);

    return List<Comment>.from(
        await jsonDecode(response.body).map((x) => Comment.fromJson(x)));
  }
}
