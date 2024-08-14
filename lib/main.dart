import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stateful_stateless/todoApp/pages/todo_home_page.dart';

void main() async {

  //init the hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow
        ),
    );
  }
}