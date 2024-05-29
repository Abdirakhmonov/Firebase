import 'package:flutter/material.dart';
import 'package:homework_46/controllers/categories_controller.dart';
import 'package:homework_46/models/categories_model.dart';
import '../widgets/custom_drawer.dart';

class CategoriesPage extends StatelessWidget {
   CategoriesPage({super.key});

   final categoriesController = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          "Categories",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: categoriesController.getCategories(),
          builder: (BuildContext context, AsyncSnapshot<List<Categories>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Mahsulotlar mavjud emas1"),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final categories = snapshot.data;
            return categories == null || categories.isEmpty
                ? const Center(child: Text("Mahsulotlar mavjud emas!"))
                : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2, mainAxisExtent: 250),
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];
                return Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(category.image),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(category.name, style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                        ),),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
    );
  }
}
