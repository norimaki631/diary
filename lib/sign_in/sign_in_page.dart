import 'package:diary/logger.dart';
import 'package:diary/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    logger.info('サインインできた');
    return await auth.signInWithCredential(credential);
  }

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
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                try {
                  final userCredential = await signInWithGoogle();
                  const TimeLineRoute().go(context);
                } on FirebaseAuthException catch (e) {
                  logger.info('FirebaseAuthException');
                  logger.info(e.code);
                } on Exception catch (e) {
                  logger.info('Exception');
                  logger.info(e.toString());
                }
              },
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
