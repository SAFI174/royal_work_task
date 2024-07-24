part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authSignin(
      {required String email, required String password}) = _AuthSignIn;
  const factory AuthEvent.authSignup(
      {required String name,
      required String email,
      required String password}) = _AuthSignUp;
  const factory AuthEvent.signOut() = _AuthSignOut;
  const factory AuthEvent.getUserInfo() = _AuthGetUserInfo;
}
