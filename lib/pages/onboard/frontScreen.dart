import 'package:flutter/material.dart';

class Frontscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<Frontscreen> createState() => _FrontscreenState();
}

class _FrontscreenState extends State<Frontscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/tree.png"),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Get Started",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/google.png"),
                  ),
                  SizedBox(width: 50),
                  Center(child: Text("Sign In with Gooogle")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
