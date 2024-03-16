//TODO: Criar provedor de dados para produtos

import 'package:from_zero_to_hero_ht/features/products/data/product_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/product.dart';

part 'product_provider.g.dart';

@riverpod
FutureOr<List<Product>> productsByCategory(ProductsByCategoryRef ref,
    {required String category}) async {
  final products =
      await ref.watch(productRepositoryProvider).findAllByCategories(category);
  return products;
}
