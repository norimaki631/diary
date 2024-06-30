import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePartial extends StatelessWidget {
  const DatePartial({
    super.key,
    required this.createdAt,
  });
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('hh:mm').format(createdAt).toString(),
    );
  }
}
