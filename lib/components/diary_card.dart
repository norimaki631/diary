import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  const DiaryCard({
    super.key,
    required this.content,
    required this.dateWidget,
  });
  final String content;
  final Widget dateWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      height: 100,
      child: SingleChildScrollView(
        child: Column(
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
                  dateWidget,
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
