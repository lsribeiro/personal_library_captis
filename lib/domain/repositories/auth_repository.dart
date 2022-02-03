import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepository {
  GoogleSignInAccount? getUser();
  Future<GoogleSignInAccount?> signIn();
  Future<GoogleSignInAccount?> signOut();
}
