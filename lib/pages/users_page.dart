import 'package:eclipse_test_task/api/user_api.dart';
import 'package:eclipse_test_task/models/user.dart';
import 'package:eclipse_test_task/pages/detail_user_page.dart';
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
    super.initState();
    users = UserApi().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JSON PLACEHOLDER API',
          style: TextStyle(
            fontFamily: 'GothamPro',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return Card(
                  child: InkWell(
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 40,
                      ),
                      trailing: const Icon(
                        Icons.arrow_right,
                        color: Colors.black,
                      ),
                      title: Text(
                        '${snapshot.data?[index].username}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Text(
                          '${snapshot.data?[index].name}',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailUserPage(
                            user: snapshot.data?[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else if (snapshot.hasError) {
            Text(snapshot.error.toString());
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
