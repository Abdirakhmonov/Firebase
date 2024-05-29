import 'package:homework_46/services/categories_service.dart';

import '../models/categories_model.dart';

class CategoriesController {
  final categoriesHttpService = CategoriesHttpService();
  Future<List<Categories>> getCategories() async {
    List<Categories> categories =
        await categoriesHttpService.getCategoriesHttp();

    return categories;
  }
}
