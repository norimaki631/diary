import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({super.key, required this.createdAt, required this.content});
  final String createdAt;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            subtitle: Text(createdAt),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
