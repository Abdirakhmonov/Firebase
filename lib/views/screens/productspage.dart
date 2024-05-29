import 'package:flutter/material.dart';
import 'package:homework_46/controllers/product_controller.dart';
import 'package:homework_46/views/widgets/custom_drawer.dart';

import '../../models/product_model.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          "Products",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: productsController.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
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
          final products = snapshot.data;
          return products == null || products.isEmpty
              ? const Center(child: Text("Mahsulotlar mavjud emas!"))
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: 26,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      mainAxisExtent: 315),
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
                    return Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInImage.assetNetwork(
                              placeholder: products[2].images,
                              image: product.images),
                          // Image.network(product.images),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
