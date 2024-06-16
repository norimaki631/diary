import 'package:flutter/material.dart';

class DailyCard extends StatelessWidget {
  const DailyCard({
    super.key,
    required this.date,
    required this.content,
  });
  final String date;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                const Text(
                  'LLMによる大要約',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            content,
          ],
        ),
      ),
    );
  }
}
