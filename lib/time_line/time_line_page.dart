import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/components/diary_card.dart';
import 'package:diary/components/user_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({super.key});

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collectionGroup('diary')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('データがありません'));
                  }

                  final Map<String, List<Map<String, String>>> userDiaries = {};

                  for (var document in snapshot.data!.docs) {
                    final documentData =
                        document.data()! as Map<String, dynamic>;
                    final userId = document.reference.path.split('/')[1];

                    if (!userDiaries.containsKey(userId)) {
                      userDiaries[userId] = [];
                    }

                    userDiaries[userId]!.add({
                      'createdAt':
                          documentData['createdAt']!.toDate().toString(),
                      'content': documentData['content']! as String,
                    });
                  }

                  return ListView.builder(
                    itemCount: userDiaries.length,
                    itemBuilder: (BuildContext context, int index) {
                      final userId = userDiaries.keys.elementAt(index);
                      final diaries = userDiaries[userId]!;

                      return UserGroup(
                        user: userId,
                        content: Column(
                          children: diaries.map((diary) {
                            return Center(
                              child: DiaryCard(
                                createdAt: diary['createdAt']!,
                                content: diary['content']!,
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
