import 'package:flutter/material.dart';

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
