import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eclipse_test_task/api/comment_api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendCommentPage extends StatefulWidget {
  const SendCommentPage({Key? key, this.postId}) : super(key: key);
  final String? postId;

  @override
  _SendCommentPageState createState() => _SendCommentPageState();
}

class _SendCommentPageState extends State<SendCommentPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final commentController = TextEditingController();
  final commentApi = CommentApi();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nameController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              validator: (email) => !EmailValidator.validate(email!)
                  ? 'enter a valid email'
                  : null,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TextFormField(
                controller: commentController,
                maxLines: 6,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: 'Your Comment',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Send'),
              onPressed: () {
                final form = formKey.currentState;
                if (form!.validate()) {
                  final email = emailController.text;
                  commentApi.sendComment(widget.postId, nameController.text,
                      email, commentController.text);
                  Navigator.pop(context);

                  Fluttertoast.showToast(
                    msg: 'Thanks for comment!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
