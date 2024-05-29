import 'package:flutter/material.dart';
import '../../controllers/users_controller.dart';
import '../widgets/custom_drawer.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});

  final usersController = UsersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          "Users",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: usersController.getUsers(),
        builder: (context, snapshot) {
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
          final users = snapshot.data;
          return users == null || users.isEmpty
              ? const Center(child: Text("Mahsulotlar mavjud emas!"))
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: 50,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      crossAxisCount: 2,
                      mainAxisExtent: 230),
                  itemBuilder: (BuildContext context, int index) {
                    final user = users[index];
                    return Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(user.image, height: 150,fit: BoxFit.fill,),
                          const SizedBox(
                            height: 10,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              user.email,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
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
