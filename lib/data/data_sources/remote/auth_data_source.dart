import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSource {
  GoogleSignInAccount? _account;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: '487717251994-1crelvk5sr9v3r919dbf9n9h4qcndg4n.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount? getUser() {
    return _account;
  }

  Future<GoogleSignInAccount?> signIn() async {
    final account = await _googleSignIn.signInSilently();
    _account = account;
    if (account != null) return account;

    try {
      return _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<GoogleSignInAccount?> signOut() async {
    final account = await _googleSignIn.signOut();

    _account = account;

    return account;
  }
}
