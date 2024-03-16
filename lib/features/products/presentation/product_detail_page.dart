import 'package:flutter/material.dart';

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
      body: const Expanded(
        child: Column(
          children: [
            Text('A'),
            Text('B'),
            Text('C'),
          ],
        ),
      ),
    );
  }
}
