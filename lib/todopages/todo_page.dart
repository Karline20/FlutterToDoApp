// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  TextEditingController textEditingController = TextEditingController();

  //greeting message variable
  String greetingMessage = "";

  //greet user method 

  void greetUser(){

    String userName = textEditingController.text;

    setState(() {
      greetingMessage = "Hello, ${userName}";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //greet user message
              Text(greetingMessage),

              //text field
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type your name..",
                ),
              ),
          
              //button
              ElevatedButton(
                onPressed: greetUser, 
                child: Text("Tap!"))
            ],
          ),
        ),
      ),
    );
  }
}