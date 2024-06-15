import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/router.dart';
import 'package:diary/time_line/diary_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({super.key});

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uid = auth.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Line'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                alignment: Alignment.topCenter,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .collection('diary')
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('エラーが発生しました');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final list = snapshot.requireData.docs
                        .map<List>((DocumentSnapshot document) {
                      final documentData =
                          document.data()! as Map<String, dynamic>;
                      return [
                        documentData['createdAt']!.toDate().toString(),
                        documentData['content']! as String,
                      ];
                    }).toList();

                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: DiaryCard(
                            createdAt: list[index][0],
                            content: list[index][1],
                            // list[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
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
                ElevatedButton(
                  onPressed: () {
                    auth.signOut();
                    const SignInRoute().go(context);
                  },
                  child: const Text('サインアウト'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
