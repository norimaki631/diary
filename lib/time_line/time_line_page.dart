import 'package:diary/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimeLinePage extends StatelessWidget {
  TimeLinePage({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Line'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'タイムラインを表示するよ',
            ),
            ElevatedButton(
              onPressed: () {
                auth.signOut();
                const SignInRoute().go(context);
              },
              child: const Text('サインアウト'),
            ),
          ],
        ),
      ),
    );
  }
}
