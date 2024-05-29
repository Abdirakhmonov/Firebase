import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductsController {
  final productsHttpService = ProductsHttpService();
  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.getProductsHttp();

    return products;
  }
}