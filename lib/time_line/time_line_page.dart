import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/components/daily_card.dart';
import 'package:diary/components/user_group.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

                  final Map<String, Map<String, List<dynamic>>> userDiaries =
                      {};

                  for (var document in snapshot.data!.docs) {
                    final documentData =
                        document.data()! as Map<String, dynamic>;
                    final userId = document.reference.path.split('/')[1];
                    final createdAt = documentData['createdAt']!.toDate();
                    final formattedDate =
                        DateFormat('yyyy/MM/dd').format(createdAt);

                    if (!userDiaries.containsKey(userId)) {
                      userDiaries[userId] = {};
                    }
                    if (!userDiaries[userId]!.containsKey(formattedDate)) {
                      userDiaries[userId]![formattedDate] = [];
                    }

                    userDiaries[userId]![formattedDate]!.add({
                      'createdAt': createdAt,
                      'content': documentData['content']! as String,
                    });
                  }

                  return ListView.builder(
                    itemCount: userDiaries.length,
                    itemBuilder: (BuildContext context, int index) {
                      final userId = userDiaries.keys.elementAt(index);
                      final dates = userDiaries[userId]!.keys.toList();

                      return UserGroup(
                        user: userId,
                        content: Column(
                          children: dates.map((date) {
                            final diaries = userDiaries[userId]![date]!;
                            return Container(
                              padding: const EdgeInsets.all(10),
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: ListView(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        date,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'LLMによる大要約',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  ...diaries.map((diary) {
                                    return Center(
                                      child: DailyCard(
                                        createdAt: diary['createdAt']!,
                                        content: diary['content']!,
                                      ),
                                    );
                                  }).toList(),
                                ],
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
