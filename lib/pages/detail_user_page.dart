import 'package:eclipse_test_task/api/album_api.dart';
import 'package:eclipse_test_task/api/photo_api.dart';
import 'package:eclipse_test_task/api/post_api.dart';
import 'package:eclipse_test_task/models/album.dart';
import 'package:eclipse_test_task/models/photo.dart';
import 'package:eclipse_test_task/models/post.dart';
import 'package:eclipse_test_task/pages/albums_page.dart';
import 'package:eclipse_test_task/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_test_task/models/user.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _DetailUserPageState createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  late Future<List<Post>> postObject;
  late Future<List<Album>> albumObject;
  late Future<List<Photo>> photoObject;
  static const kDefualPadding = 12.0;

  @override
  void initState() {
    super.initState();

    postObject = PostApi().fetchPostsByUserId(widget.user!.id);
    albumObject = AlbumApi().fetchAlbumsByUserId(widget.user!.id);
    photoObject = PhotoApi().fetchPhotoByUserId(widget.user!.id);
  }

  // Для отображения имени пользователя
  Widget _buildName() {
    return Center(
      child: Text(
        '${widget.user!.name}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Для отображения CatchPhrase
  Widget _buildCatchPhrase() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const WidgetSpan(
              child: Icon(
                Icons.format_quote,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: '${widget.user!.company!.catchPhrase}',
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.grey),
            ),
            const WidgetSpan(
              child: Icon(
                Icons.format_quote,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Для отображения реквизитов
  Widget _buildInfoGraph(IconData? iconData, String? data) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              iconData,
              size: 21,
            ),
          ),
          TextSpan(
              text: ': $data', style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }

  //Отвечает за отображения блока с постами пользователя
  Widget _buildPostsBlock() {
    //функция возвращает первую строку Post.body
    String? getFirstLineOfBody(AsyncSnapshot<List<Post>> snapshot, var index) {
      var lines = snapshot.data?[index].body
          ?.split('\n'); //Разделяем полученный контент по \n
      return lines?[0]; //возвращаем первую строку body поста
    }

    return Column(
      children: [
        const Text(
          'Posts',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
        SizedBox(
          height: 230,
          child: FutureBuilder<List<Post>>(
              future: postObject,
              // Shimmer.fromColors(
              //     baseColor: Colors.grey[500]!,
              //     highlightColor: Colors.grey[100]!,
              //     enabled: true,
              //     child:
              // );
              builder: (context, snapshot) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: Text(
                      '${index + 1}. ${snapshot.data?[index].title}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      '${getFirstLineOfBody(snapshot, index)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  itemCount: 3,
                );
              }),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostsPage(
                    posts: postObject,
                  ),
                ),
              );
            },
            child: const Text(
              'Show all posts',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  //Отвечает за отображения блока с альбомами пользователя
  Widget _buildAlbumsBlock() {
    return Column(
      children: [
        const Text(
          'Albums',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
        SizedBox(
          height: 180,
          child: FutureBuilder<List<Album>>(
              future: albumObject,
              builder: (context, snapshot) {
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(height: 5),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    leading: const CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150/771796')),
                    title: Text(
                      '${snapshot.data?[index].title}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  itemCount: 3,
                );
              }),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumsPage(
                    albums: albumObject,
                  ),
                ),
              );
            },
            child: const Text(
              'Show all albums',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user!.username.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.account_circle_outlined, size: 120),
                ],
              ),
              _buildName(),
              const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
              _buildCatchPhrase(),
              const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
              _buildInfoGraph(Icons.phone_iphone, widget.user!.phone), //Phone
              const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
              _buildInfoGraph(Icons.email_outlined, widget.user!.email), //Email
              const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
              _buildInfoGraph(Icons.web, widget.user!.website), //Website
              const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
              _buildInfoGraph(
                  Icons.business, widget.user!.company!.name), //Company name
              const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
              _buildInfoGraph(Icons.location_on_outlined,
                  '${widget.user!.address!.city}, ${widget.user!.address!.street}, ${widget.user!.address!.suite}'), //Address
              const Padding(padding: EdgeInsets.only(top: kDefualPadding)),
              _buildInfoGraph(
                  Icons.person_outline,
                  widget.user!.company!
                      .bs), //user's position in company (business)
              const Padding(padding: EdgeInsets.only(top: kDefualPadding * 2)),
              _buildPostsBlock(),
              const Padding(padding: EdgeInsets.only(top: kDefualPadding * 2)),
              _buildAlbumsBlock(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _horizontalListView() {
  //   return Row(children: [
  //     Expanded(
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemBuilder: (_, __) => _buildBox(color: Colors.orange),
  //         itemCount: 4,
  //       ),
  //     ),
  //     TextButton(onPressed: () {}, child: const Text('Show all'))
  //   ]);
  // }

  // Widget _buildBox({Color? color}) => Container(
  //     margin: EdgeInsets.all(12), height: 100, width: 120, color: color);

}
