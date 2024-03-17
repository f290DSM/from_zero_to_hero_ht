import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../domain/product.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detatil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: PageView(
                children: product.images
                    .map((e) => Image.network(e, fit: BoxFit.cover))
                    .toList(),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(product.title,
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(product.brand,
                      style: Theme.of(context).textTheme.headlineMedium),
                ),
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Categoria'),
                  subtitle:
                      Text(product.category.replaceAll('_', ' ').toUpperCase()),
                ),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('Descrição'),
                  subtitle: Text(product.description),
                ),
                ListTile(
                  leading: const Icon(Icons.price_change),
                  title: const Text('Preço'),
                  subtitle: Text('${product.price}'),
                ),
                ListTile(
                  leading: const Icon(Icons.rate_review),
                  title: const Text('Avaliação'),
                  subtitle: Text(product.rating.toStringAsFixed(2)),
                ),
                ListTile(
                  leading: const Icon(Icons.production_quantity_limits),
                  title: const Text('Estoque'),
                  subtitle: Text(product.stock.toStringAsFixed(0)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
