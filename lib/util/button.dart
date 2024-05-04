import "package:flutter/material.dart";

class Buttontile extends StatelessWidget {
  final String name;
  VoidCallback  onPressed;
 
   Buttontile({super.key  ,required this.name , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.brown,
      onPressed: onPressed,
      child: Text(name),
    );
  }
}