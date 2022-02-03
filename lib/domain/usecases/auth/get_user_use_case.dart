import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal_library_captis/data/repositories/auth_repository_impl.dart';

class GetUserUseCase {
  final AuthRepositoryImpl _repo;

  GetUserUseCase(this._repo);

  GoogleSignInAccount? call() {
    return _repo.getUser();
  }
}