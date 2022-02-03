import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_library_captis/data/repositories/auth_repository_impl.dart';

class SignInUseCase {
  final AuthRepositoryImpl _repo;

  SignInUseCase(this._repo);

  Future<GoogleSignInAccount?> call() async {
    return _repo.signIn();
  }
}
