import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _controller = TextEditingController();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                autofocus: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final document = <String, dynamic>{
                  'content': _controller.text,
                  'createdAt': Timestamp.fromDate(DateTime.now()),
                };
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .collection('diary')
                    .doc()
                    .set(document);
                setState(_controller.clear);
              },
              child: const Text('送信'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
