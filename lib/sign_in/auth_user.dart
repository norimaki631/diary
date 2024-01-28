import 'package:diary/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_user.g.dart';

@Riverpod(keepAlive: true)
class AuthUser extends _$AuthUser {
  @override
  FutureOr<String?> build() async {
    try {
      return FirebaseAuth.instance.currentUser?.uid;
    } on FirebaseAuthException catch (e) {
      logger.info('FirebaseAuthException');
      logger.info(e.code);
    } on Exception catch (e) {
      logger.info('Exception');
      logger.info(e.toString());
    }
    return null;
  }

  Future<void> signIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    logger.info('サインインできた');
  }
}
