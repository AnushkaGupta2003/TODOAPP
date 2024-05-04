
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoTile extends StatelessWidget {

final String taskname;
final bool taskcompleted;
Function(bool?)? onChanged;
Function(BuildContext)? deletetaskfunction;
   TodoTile({
    super.key, 
    required this.taskname,
     required this.taskcompleted,
     required this.onChanged,
      required this.deletetaskfunction,
     });
    
  
  @override
  Widget build(BuildContext context) {



    return Padding(
      
      padding: const EdgeInsets.only(top:25, left: 25, right:25),
     
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children:[SlidableAction(
          onPressed: deletetaskfunction,
        icon: Icons.delete,
        borderRadius: BorderRadius.circular(12),
        backgroundColor:  Colors.black,)]
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(value: taskcompleted, onChanged: onChanged, activeColor: Colors.brown,),
        
              Text(taskname ,style: TextStyle(color: Colors.black, decoration: taskcompleted? TextDecoration.lineThrough : null , )),
            ],
          ),
        ),
      ),
    
    );
  }
}