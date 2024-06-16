import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({
    super.key,
    required this.createdAt,
    required this.content,
  });
  final DateTime createdAt;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 5,
              ),
              child: Row(
                children: [
                  const Text('LLMによる要約'),
                  const SizedBox(width: 10),
                  Text(DateFormat('yyyy/MM/dd hh:mm')
                      .format(createdAt)
                      .toString()),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
                bottom: 10,
              ),
              alignment: Alignment.centerLeft,
              child: Text(content),
            ),
          ],
        ),
      ),
    );
  }
}
