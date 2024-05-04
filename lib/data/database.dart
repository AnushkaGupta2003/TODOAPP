import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List todolist=[];
  List filteredtodolist=[];
//reference the box

 final _mybox = Hive.box('mybox');

 //initial data when user open app for first time ever
 void createInitialTask(){
   todolist.add(["Cheer Up" , false]);
   filteredtodolist= todolist;
 }

 //load todolist from database
 void loaddatabase(){
  todolist= _mybox.get("TODOLIST");
  filteredtodolist= todolist;
 }

 //update database
 void updaetdb(){
  _mybox.put("TODOLIST" , todolist);
 }
}