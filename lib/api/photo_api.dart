import 'dart:convert';

import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/photo.dart';
import 'package:http/http.dart' as http;

class PhotoApi {
  Future<List<Photo>> fetchPhotoByUserId(var userId) async {
    Map<String, String?> parameters = {
      'userId': userId,
    };

    var uri = Uri.https(ConstantsApi.placeholderBaseURLDomain,
        ConstantsApi.placeHolderPhotosPath, parameters);

    var response = await http.get(uri);

    return List<Photo>.from(
        await jsonDecode(response.body).map((x) => Photo.fromJson(x)));
  }
}
