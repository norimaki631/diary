import 'package:flutter/material.dart';

class UserGroup extends StatelessWidget {
  const UserGroup({
    super.key,
    required this.user,
    required this.content,
  });
  final String user;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(user),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: content,
        ),
      ],
    );
  }
}
