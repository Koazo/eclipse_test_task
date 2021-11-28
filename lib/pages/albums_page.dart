import 'package:eclipse_test_task/models/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key, this.albums}) : super(key: key);
  final Future<List<Album>>? albums;

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  Future<List<Album>>? albums;

  @override
  void initState() {
    super.initState();
    albums = widget.albums;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All albums',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Album>>(
        future: albums,
        builder: (context, snapshot) {
          return AnimationLimiter(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: index,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ListTile(
                        onTap: () {},
                        title: Text(
                          '${index + 1}. ${snapshot.data?[index].title}',
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            ),
          );
        },
      ),
    );
  }
}
