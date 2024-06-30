import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFull extends StatelessWidget {
  const DateFull({
    super.key,
    required this.createdAt,
  });
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('MM/dd hh:mm').format(createdAt).toString(),
    );
  }
}
