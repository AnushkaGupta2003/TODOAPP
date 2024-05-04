// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_drive/data/database.dart';
import 'package:test_drive/util/dialog.dart';
import 'package:test_drive/util/todo_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//refrence the hive box
final _mybox= Hive.box('mybox');

ToDoDataBase db = ToDoDataBase();
 @override



void initState() {
  // if this is the first time eveer opeing the app then make default data
    

    if(_mybox.get("TODOLIST") == null){
    db.createInitialTask();
    }
    else{
    db.loaddatabase();
    }
  //db.filteredtodolist= db.todolist;
    super.initState();
  }

final _controller = TextEditingController();
final mycontroller = TextEditingController();

void checkboxchange(int index){ //make checkbox functional
  setState(() {
    db.todolist[index][1]=!db.todolist[index][1];
    db.filteredtodolist= db.todolist;
  });
  db.updaetdb();
  
}

void savenewtask(){ //add new task
  setState(() {
    if(_controller.text != "") {
    db.todolist.add([_controller.text , false]);
     db.filteredtodolist= db.todolist;
     }
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updaetdb();
}
//create new task when user press add button
void createnewtask(){
 showDialog(context: context, builder: (context){
  return DialogBox(
    controller: _controller,
    onsave: savenewtask,
    oncancel: (){
      Navigator.of(context).pop();
    },
  );
 });
}

//delete task from todolist
void deletetaskfunction(int index){
  setState(() {
    db.todolist.removeAt(index);
    db.filteredtodolist= db.todolist;
  });
  db.updaetdb();
}

void filtertask(String value){
  List temp=[];
  setState(() {
    
    db.todolist.forEach((element) {
      if(element[0].toLowerCase().contains(value.toLowerCase())){
        temp.add(element);
      }
    });
    db.filteredtodolist = temp;
  });
}
 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 197, 158, 100),
      appBar: AppBar(
        leading: Image.asset('assets/images/appicon2.png'),
        elevation: 0,
        centerTitle: true,
        title: Text("To Do App" , style: GoogleFonts.laila()
        
),
        
        backgroundColor: Colors.white30,),

        
       

          body: Column(
            children: [
                 TextField(
                  
                  controller: mycontroller,
                 decoration: const InputDecoration(prefixIcon: Icon(Icons.search),
                 
               border: OutlineInputBorder(), 
              hintText: "Search for task"),
                 onChanged: (value) => {filtertask(value)},
                  ),
                 
                 
        Expanded(
          child: ListView.builder(
             shrinkWrap: true,
           itemCount: db.filteredtodolist.length,
           itemBuilder: (context, index) {
             return TodoTile(
              taskname: db.filteredtodolist[index][0], 
              taskcompleted: db.filteredtodolist[index][1],
               onChanged:(value) {
                 checkboxchange(index);
               }, 
               deletetaskfunction: (context){deletetaskfunction(index);},);
           },
          ),
        ),

           
            ],
          ),
           floatingActionButton:     FloatingActionButton(
          onPressed:
            createnewtask
          ,
          backgroundColor: Colors.black,
          child: Icon(Icons.add , color: Colors.white,) ),
               
    );
  }
}