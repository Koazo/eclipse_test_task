import 'package:carousel_slider/carousel_slider.dart';
import 'package:eclipse_test_task/api/album_api.dart';
import 'package:eclipse_test_task/models/album.dart';
import 'package:eclipse_test_task/models/photo.dart';
import 'package:flutter/material.dart';

class DetailAlbumPage extends StatefulWidget {
  const DetailAlbumPage({Key? key, this.album}) : super(key: key);
  final Album? album;

  @override
  _DetailAlbumPageState createState() => _DetailAlbumPageState();
}

class _DetailAlbumPageState extends State<DetailAlbumPage> {
  late Future<List<Photo>> photos;

  @override
  void initState() {
    // TODO: implement initState
    photos = AlbumApi().fecthPhotosByAlbumId(widget.album?.id);
  }

  final List<String> imageList = ['', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Album',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    '${widget.album?.title}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            FutureBuilder<List<Photo>>(
                future: photos,
                builder: (context, snapshot) {
                  return CarouselSlider(
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        autoPlay: true),
                    items: snapshot.data
                        ?.map(
                          (e) => ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  e.url,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
