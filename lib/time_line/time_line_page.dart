import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/components/daily_card.dart';
import 'package:diary/components/diary_card.dart';
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
  final Map<String, int> _selectedIndexes = {};

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
                      final dates = userDiaries[userId]!.keys.toList()
                        ..sort((a, b) => b.compareTo(a)); // 日付の降順にソート

                      _selectedIndexes[userId] ??= 0;

                      return Column(
                        children: [
                          DropdownButton<String>(
                            value: dates[_selectedIndexes[userId]!],
                            items: dates.map((date) {
                              return DropdownMenuItem<String>(
                                value: date,
                                child: Text(date),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedIndexes[userId] =
                                    dates.indexOf(newValue!);
                              });
                            },
                          ),
                          UserGroup(
                            content: IndexedStack(
                              index: _selectedIndexes[userId],
                              children: dates.map((date) {
                                final diaries = userDiaries[userId]![date]!;
                                return DailyCard(
                                  date: date,
                                  content: Column(
                                    children: diaries.map((diary) {
                                      return DiaryCard(
                                        createdAt: diary['createdAt']!,
                                        content: diary['content']!,
                                      );
                                    }).toList(),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
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
