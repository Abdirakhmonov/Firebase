import 'package:flutter/material.dart';
import 'package:homework_46/views/screens/categories_page.dart';
import 'package:homework_46/views/screens/productspage.dart';

import '../screens/users_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProductsPage()));
              },
              child: const Text(
                "Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CategoriesPage()));
              },
              child: const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => UsersPage()));
              },
              child: const Text(
                "Users",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}
