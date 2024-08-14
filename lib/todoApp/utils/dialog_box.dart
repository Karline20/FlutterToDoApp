import 'package:flutter/material.dart';
import 'package:stateful_stateless/todoApp/utils/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;


  DialogBox({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            //button -> Save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSaved),

                const SizedBox(width: 4),

                // cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
            
          ],
        ),
      ),
    );
  }
}