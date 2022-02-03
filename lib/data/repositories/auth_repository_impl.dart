import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_library_captis/data/data_sources/remote/auth_data_source.dart';
import 'package:personal_library_captis/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _remote;

  AuthRepositoryImpl(this._remote);

  @override
  GoogleSignInAccount? getUser() {
    return _remote.getUser();
  }

  @override
  Future<GoogleSignInAccount?> signIn() {
    return _remote.signIn();
  }

  @override
  Future<GoogleSignInAccount?> signOut() {
    return _remote.signOut();
  }

}
