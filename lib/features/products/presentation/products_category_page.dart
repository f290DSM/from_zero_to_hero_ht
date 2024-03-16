import 'package:flutter/material.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/product_detail_page.dart';

import '../domain/product.dart';

class ProductBycategoryConsumer extends StatelessWidget {
  const ProductBycategoryConsumer(this.category, {super.key});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products By Category'),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          //TODO: Implementem os cards com base na especificacao do M3.
          return Card(
            child: ListTile(
              title: Text('Titulo do produto ${index + 1}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(product: Product()),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
