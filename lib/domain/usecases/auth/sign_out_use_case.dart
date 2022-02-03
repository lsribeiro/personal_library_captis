import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_library_captis/data/repositories/auth_repository_impl.dart';

class SignOutUseCase {
  final AuthRepositoryImpl _repo;

  SignOutUseCase(this._repo);

  Future<GoogleSignInAccount?> call() async {
    return _repo.signOut();
  }
}
