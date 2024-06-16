import 'package:flutter/material.dart';

class UserGroup extends StatelessWidget {
  const UserGroup({
    super.key,
    required this.content,
  });
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: content,
        ),
      ],
    );
  }
}
