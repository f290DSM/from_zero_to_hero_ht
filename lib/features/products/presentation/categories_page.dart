import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/providers/category_provider.dart';

import 'widgets/category_widget.dart';
import 'widgets/custom_card_widget.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text('Category Products'),
      ),
      body: categories.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final category = data[index];
                return CardGrid(
                  category: category,
                  materialColor: getMaterialColor(index),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
