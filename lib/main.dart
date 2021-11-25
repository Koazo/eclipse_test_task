import 'package:eclipse_test_task/pages/users_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
        fontFamily: 'GothamPro',
        appBarTheme: const AppBarTheme(
            color: Colors.white, elevation: .0, foregroundColor: Colors.black),
      ),
      home: UsersPage());
}
