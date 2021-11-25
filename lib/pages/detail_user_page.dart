import 'package:flutter/material.dart';
import 'package:eclipse_test_task/models/user.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _DetailUserPageState createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user!.username.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.account_circle_outlined, size: 220),
            ],
          ),
          Text('Name: ${widget.user!.name}'),
          const SizedBox(height: 5),
          Text('Phone: ${widget.user!.phone}'),
          const SizedBox(height: 5),
          Text('Email: ${widget.user!.email}'),
          const SizedBox(height: 5),
          Text('Website: ${widget.user!.website}'),
          const SizedBox(height: 5),
          Text('Company: ${widget.user!.company!.name}'),
          const SizedBox(height: 5),
          Text('Business: ${widget.user!.company!.bs}'),
          const SizedBox(height: 5),
          Text(
            'Catch Phrase: "${widget.user!.company!.name}"',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 5),
          Text(
              'Business: ${widget.user!.address!.city}, ${widget.user!.address!.street}, ${widget.user!.address!.suite}'),
        ],
      ),
    );
  }
}
