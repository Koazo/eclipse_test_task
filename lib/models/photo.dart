class Photo {
  String? albumId;
  String? id;
  String? title;
  late String url;
  String? thumbnailUrl;

  Photo(
      {this.albumId,
      this.id,
      this.title,
      required this.url,
      this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'].toString();
    id = json['id'].toString();
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
