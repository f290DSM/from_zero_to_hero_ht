import 'dart:math';

import 'package:flutter/material.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/products_category_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.categoria,
  });

  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text(categoria.substring(0, 1)),
            ),
            title: Text(categoria),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Text(
                'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. '),
          ),
          ButtonBar(
            children: [
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            ],
          ),
        ],
      ),
    );
  }
}

class CardGrid extends StatelessWidget {
  const CardGrid({
    super.key,
    required this.category,
    required this.materialColor,
  });

  final String category;
  final MaterialColor materialColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductBycategoryConsumer(category),
          ),
        );
      },
      child: Card.outlined(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Flexible(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final height = constraints.maxHeight;
                  return Stack(
                    children: [
                      Container(
                        color: materialColor.shade400,
                      ),
                      Align(
                        alignment: const Alignment(-1, -0.8),
                        child: Transform.rotate(
                          angle: 45,
                          child: Container(
                            width: height,
                            height: height * .5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: materialColor.shade300,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -(height / 2),
                        bottom: -(height * .4),
                        child: Container(
                          width: height,
                          height: height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * .5),
                            color: materialColor.shade900,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        right: -20,
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                            width: height,
                            height: height,
                            decoration: BoxDecoration(
                              color: materialColor.shade700,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0, 0.5),
                        child: Container(
                          width: height * 1.2,
                          height: height * .4,
                          decoration: BoxDecoration(
                            color: materialColor.shade600,
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.replaceAll('-', ' ').toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  color: materialColor.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
