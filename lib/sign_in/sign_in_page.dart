import 'package:diary/router.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'サインインするよ',
            ),
            ElevatedButton(
              onPressed: () {
                const SignUpRoute().go(context);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
