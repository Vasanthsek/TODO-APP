import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List todoList = [];
  
  final _myBox = Hive.box("mybox");
  void createInitialData(){
    todoList = [];
  }
  void loadData(){
   todoList = _myBox.get("TODOLIST");
  }
  void updateDatabase(){
   _myBox.put("TODOLIST", todoList);
  }
}