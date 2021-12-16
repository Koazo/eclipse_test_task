import 'dart:convert';

import 'package:eclipse_test_task/constants/apis.dart';
import 'package:eclipse_test_task/models/album.dart';
import 'package:eclipse_test_task/models/photo.dart';
import 'package:http/http.dart' as http;

class AlbumApi {
  Future<List<Album>> fetchAlbumsByUserId(var userId) async {
    Map<String, String?> parameters = {
      'userId': userId,
    };

    var uri = Uri.https(ConstantsApi.placeholderBaseURLDomain,
        ConstantsApi.placeholderAlbumsPath, parameters);

    var response = await http.get(uri);

    return List<Album>.from(
        await jsonDecode(response.body).map((x) => Album.fromJson(x)));
  }

  Future<List<Photo>> fecthPhotosByAlbumId(var albumId) async {
    Map<String, String?> parameters = {
      'albumId': albumId,
    };

    var uri = Uri.https(ConstantsApi.placeholderBaseURLDomain,
        ConstantsApi.placeHolderPhotosPath, parameters);

    var response = await http.get(uri);

    return List<Photo>.from(
        await jsonDecode(response.body).map((x) => Photo.fromJson(x)));
  }
}
