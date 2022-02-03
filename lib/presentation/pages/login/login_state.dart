part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final GoogleSignInAccount? account;

  LoginState({this.account});

  @override
  List<Object?> get props => [account];

  LoginState copyWith({
    GoogleSignInAccount? account,
  }) {
    return LoginState(
      account: account ?? this.account,
    );
  }
}
