import 'product.dart';

abstract class ProductRepository {
  Future<List<String>> findAllCategories();
  Future<List<Product>> findAllByCategories(String category);
}
