import 'package:eclipse_test_task/api/comment_api.dart';
import 'package:eclipse_test_task/models/comment.dart';
import 'package:eclipse_test_task/models/post.dart';
import 'package:eclipse_test_task/pages/send_comment_page.dart';
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
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                '${widget.post?.title}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              '${widget.post?.body}',
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const Text(
            'Comments',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SendCommentPage(
                              postId: widget.post?.id,
                            )));
              },
              child: const Text('Send Comment'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        ],
      ),
    );
  }
}
