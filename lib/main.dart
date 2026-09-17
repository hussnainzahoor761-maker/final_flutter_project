import 'package:flutter/material.dart';
import 'package:flutter_final_project/Screens/myproperties/add_property.dart';
import 'package:flutter_final_project/Screens/uthentication/loginemptypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),
      home: Loginemptypage(),
    );
  }
}
