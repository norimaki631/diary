import 'package:diary/router.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'サインアップするよ',
            ),
            ElevatedButton(
              onPressed: () {
                const SignInRoute().go(context);
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}