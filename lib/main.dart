import 'package:flutter/material.dart';
import 'package:homework_46/views/screens/categories_page.dart';
import 'package:homework_46/views/screens/productspage.dart';
import 'package:homework_46/views/widgets/custom_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: const Text(
            "Firebase",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: CategoriesPage(),
      ),
    );
  }
}
