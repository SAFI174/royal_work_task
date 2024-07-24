import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:royal_task/features/auth/domain/usecases/get_user_usecase.dart';
import 'package:royal_task/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:royal_task/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:royal_task/features/auth/domain/usecases/user_stream_usecase.dart';

import '../../../../../core/common/cubit/app_user/app_user_cubit.dart';
import '../../../../../core/common/entites/user.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/signout_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUsecase _signupUsecase;
  final SignInUsecase _signinUsecase;
  final GetUserInfoUsecase _getCurrentUserUsecase;
  final UserStreamUsecase _userStreamUsecase;
  final SignoutUsecase _signoutUsecase;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserStreamUsecase userStreamUsecase,
    required SignUpUsecase signupUsecase,
    required SignInUsecase signinUsecase,
    required SignoutUsecase signoutUsecase,
    required GetUserInfoUsecase getCurrentUserUsecase,
    required AppUserCubit appUserCubit,
  })  : _signupUsecase = signupUsecase,
        _signoutUsecase = signoutUsecase,
        _userStreamUsecase = userStreamUsecase,
        _signinUsecase = signinUsecase,
        _getCurrentUserUsecase = getCurrentUserUsecase,
        _appUserCubit = appUserCubit,
        super(const AuthState.initial()) {
    on<_AuthSignUp>(_signup);
    on<_AuthSignIn>(_signin);
    on<_AuthSignOut>(_signout);
    on<_AuthGetUserInfo>(_getCurrentUser);
  }

  void _signin(event, emit) async {
    emit(const AuthState.loading());
    final res = await _signinUsecase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (error) => emit(AuthState.failed(error.message)),
      (user) => _emitUserState(user, emit),
    );
  }

  void _signup(event, emit) async {
    emit(const AuthState.loading());

    var res = await _signupUsecase(
      SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (error) => emit(AuthState.failed(error.message)),
      (user) => _emitUserState(user, emit),
    );
  }

  void _getCurrentUser(event, Emitter<AuthState> emit) async {
    // Emit loading state
    emit(const AuthState.loading());

    // Listen to the user stream
    await _userStreamUsecase().listen((user) async {
      if (user != null) {
        // Get the current user details
        final res = await _getCurrentUserUsecase(NoParams());
        res.fold(
          (error) {
            emit(AuthState.failed(error.message));
          },
          (user) => _emitUserState(user, emit),
        );
      } else {
        emit(const AuthState.signedOut());
      }
    }).asFuture();
  }

  void _emitUserState(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);

    emit(AuthState.success(user));
  }

  void _signout(_AuthSignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final res = await _signoutUsecase(NoParams());

    res.fold(
      (error) => emit(AuthState.failed(error.message)),
      (message) {
        _appUserCubit.updateUser(null);
        emit(const AuthState.signedOut());
      },
    );
  }
}
