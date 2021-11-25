import 'package:eclipse_test_task/api/user_api.dart';
import 'package:eclipse_test_task/models/user.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late Future<List<User>> users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = UserApi().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json placeholder example'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data}'),
                    subtitle: Text('${snapshot.data?.last}'),
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else if (snapshot.hasError) {
            Text('${snapshot.error.toString()}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
