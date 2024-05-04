
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_drive/pages/homepage.dart';

import 'package:hive_flutter/hive_flutter.dart';


void main() async {
 
await Hive.initFlutter();

var box = await Hive.openBox('mybox');


  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
