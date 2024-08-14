import 'package:hive/hive.dart';

class ToDoDataBase {

  
  //list of todo task

  List toDoList = [];

  //reference our box
  final _myBox = Hive.box('myBox');

  // run this mehtod if this is the 1st time ever opening this app
  void createInitialData(){
   toDoList = [
    ["Task 1", false],
    ["Task 2", true],
    ["Task 3", true],
    ["Task 4", false],
    ];
  }

  //load the data from database

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database

  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }
}