import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogle {
  signInWithGoogle () async {
    final GoogleSignInAccount? gAccount = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gAccount!.authentication;

    final credentials = gAuth.accessToken;

  }
}