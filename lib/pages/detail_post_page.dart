import 'package:eclipse_test_task/api/comment_api.dart';
import 'package:eclipse_test_task/models/comment.dart';
import 'package:eclipse_test_task/models/post.dart';
import 'package:flutter/material.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({Key? key, this.post}) : super(key: key);
  final Post? post;

  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  late Future<List<Comment>> comments;

  @override
  void initState() {
    super.initState();
    comments = CommentApi().fetchCommentsByPostId(widget.post!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Center(
          child: Text(
            '${widget.post?.title}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        Text('${widget.post?.body}'),
        const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        const Text(
          'Comments',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        Expanded(
          child: FutureBuilder<List<Comment>>(
              future: comments,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        '${snapshot.data?[index].name}',
                      ),
                      subtitle: Text('${snapshot.data?[index].body}'),
                      trailing: Text('${snapshot.data?[index].email}'),
                      isThreeLine: true,
                    );
                  },
                  itemCount: snapshot.data?.length,
                );
              }),
        ),
        Container(
          height: 200,
        )
      ]),
    );
  }
}
