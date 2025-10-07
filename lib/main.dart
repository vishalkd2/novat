import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novat/controllers/post_controller.dart';
import 'package:novat/screens/post_details_screen.dart';
import 'package:novat/screens/post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home:  PostScreen(),
    );
  }
}