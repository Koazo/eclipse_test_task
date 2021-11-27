import 'package:eclipse_test_task/models/post.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key, this.posts}) : super(key: key);
  final Future<List<Post>>? posts;

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  Future<List<Post>>? posts;

  @override
  void initState() {
    super.initState();
    posts = widget.posts;
  }

  String? getFirstLineOfBody(AsyncSnapshot<List<Post>> snapshot, var index) {
    var lines = snapshot.data?[index].body
        ?.split('\n'); //Разделяем полученный контент по \n
    return lines?[0]; //возвращаем первую строку body поста
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All posts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                title: Text(
                  '${index + 1}. ${snapshot.data?[index].title}',
                ),
                subtitle: Text('${getFirstLineOfBody(snapshot, index)}'),
              );
            },
            itemCount: snapshot.data?.length,
          );
        },
      ),
    );
  }
}

// FutureBuilder<List<Post>>(
//         builder: ListView.builder(
//           itemBuilder: (context, index) {
//             return FutureBuilder<List<Post>>(
//                 future: posts,
//                 builder: (context, snapshot) {
//                   return ListTile(
//                     onTap: () {},
//                     title: Text(
//                       '${index + 1}. ${snapshot.data?[index].title}',
//                     ),
//                     subtitle: Text('${getFirstLineOfBody(snapshot, index)}'),
//                   );
//                 });
//           },
//           itemCount: ,
//         ),
//       ),