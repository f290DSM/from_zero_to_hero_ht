import 'dart:math';

import 'package:flutter/material.dart';
import 'package:from_zero_to_hero_ht/features/products/presentation/products_category_page.dart';

MaterialColor getMaterialColor(int index) {
  final colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey
  ];

  if (index + 1 > colors.length) {
    return colors[index - colors.length];
  }

  return colors[index];
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.category, required this.indexColor});

  final int indexColor;

  final String category;

  // final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    MaterialColor color = getMaterialColor(indexColor);

    return Card(
      color: color.shade400,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: color.shade900,
        onTap: () {
          //TODO: Navegar para a página de produtos
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductBycategoryConsumer(category),
            ),
          );
        },
        child: SizedBox(
          width: 200,
          height: 150,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0.5, -1.5),
                child: Container(
                  width: 120,
                  height: 90,
                  decoration: BoxDecoration(
                    color: color.shade300,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                right: -20,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: color.shade800,
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              Positioned(
                top: -20,
                left: -20,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: color.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white60,
                  ),
                  child: Text(
                    category.replaceAll('-', ' ').toUpperCase(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: color.shade800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
