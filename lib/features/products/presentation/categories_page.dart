import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/providers/category_provider.dart';

import 'widgets/category_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text('Category Products'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          final category = 'Categoria ${index + 1}';
          return CategoryCard(
            category: category,
            indexColor: index,
          );
        },
      ),
    );
  }
}
