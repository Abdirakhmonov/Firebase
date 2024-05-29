import 'dart:convert';
import 'package:homework_46/models/categories_model.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class CategoriesHttpService {
  Future<List<Categories>> getCategoriesHttp() async {
    Uri url = Uri.parse(
        "https://api.escuelajs.co/api/v1/categories");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Categories.fromJson(json)).toList();
    } else {
      throw Exception("Ma'lumot olishda hatolik bor");
    }
  }
}