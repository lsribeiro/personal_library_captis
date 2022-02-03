import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:personal_library_captis/core/di/injection_container.dart' as di;
import 'package:personal_library_captis/domain/usecases/auth/sign_in_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  Future<GoogleSignInAccount?> loginUser() async {
    final _loginUseCase = di.sl.get<SignInUseCase>();

    final account = await _loginUseCase.call();

    print(account);

    emit(state.copyWith(account: account));

    return account;
  }
}
