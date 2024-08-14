import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stateful_stateless/todoApp/data/database.dart';
import 'package:stateful_stateless/todoApp/utils/dialog_box.dart';
import 'package:stateful_stateless/todoApp/utils/todo_tile.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {

  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      //there are already existing data
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1]; 
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([ _controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSaved: saveNewTask,
        onCancel: () => Navigator.of(context).pop,
      );
    },);
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.remove(index);
    });
    db.updateDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
        },
      )
    );
  }
}