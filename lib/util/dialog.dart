
import 'package:flutter/material.dart';
import 'package:test_drive/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
   DialogBox({super.key , required this.controller, required this.onsave ,required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 227, 191, 178),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            TextField(
             controller: controller,
              decoration: const InputDecoration(border: OutlineInputBorder(), 
              hintText: "Add new task"),
            
             
            ),
            
           Row(
           
            children: [
              Buttontile(name: "Save", onPressed:onsave),
             const SizedBox(width: 15),
               Buttontile(name: "Cancel", onPressed: oncancel ),
              
            ],
           )
            ],
           )
          ,),
    );
    
  }
}