import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({
    super.key,
    required this.createdAt,
    required this.content,
  });
  final DateTime createdAt;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      height: 100,
      child: ListView(
        children: [
          Container(
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
                Text(DateFormat('hh:mm').format(createdAt).toString()),
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
    );
  }
}
