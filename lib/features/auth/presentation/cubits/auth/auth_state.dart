part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.failed(String message) = _Failed;
  const factory AuthState.success(User user) = _Success;
  const factory AuthState.signedOut() = _SingedOut;
}
