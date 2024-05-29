import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductsHttpService {
  Future<List<Product>> getProductsHttp() async {
    Uri url = Uri.parse(
        "https://api.escuelajs.co/api/v1/products");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Ma'lumot olishda hatolik bor");
    }
  }
}