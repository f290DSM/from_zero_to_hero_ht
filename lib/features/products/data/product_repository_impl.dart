import 'package:dio/dio.dart';
import 'package:from_zero_to_hero_ht/features/products/domain/product.dart';
import 'package:from_zero_to_hero_ht/features/products/domain/product_repository.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_impl.g.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio dio;

  ProductRepositoryImpl({required this.dio});

  @override
  Future<List<String>> findAllCategories() async {
    final response = await dio.get('/categories');
    return [for (final category in response.data as List) category.toString()];
  }

  @override
  Future<List<Product>> findAllByCategories(String category) async {
    final response = await dio.get('/category/$category');

    return [
      for (final product in response.data['products'] as List)
        Product.fromJson(product)
    ];
  }
}

// Criação do provedor de repository como DI.
@riverpod
ProductRepositoryImpl productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(dio: ref.watch(dioProvider));
}
