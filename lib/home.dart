import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/myDrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("home"),
        actions: [
         
        ],
      ),
      drawer: Mydrawer(),
    );
  }
}
