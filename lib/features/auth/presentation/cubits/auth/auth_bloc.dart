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
  // Use cases for handling authentication
  final SignUpUsecase _signupUsecase;
  final SignInUsecase _signinUsecase;
  final GetUserInfoUsecase _getCurrentUserUsecase;
  final UserStreamUsecase _userStreamUsecase;
  final SignoutUsecase _signoutUsecase;

  // Cubit for updating app user state
  final AppUserCubit _appUserCubit;

  // Constructor to initialize use cases and cubit
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
    // Handling different authentication events
    on<_AuthSignUp>(_signup);
    on<_AuthSignIn>(_signin);
    on<_AuthSignOut>(_signout);
    on<_AuthGetUserInfo>(_getCurrentUser);
  }

  // Handles the sign-in event
  void _signin(_AuthSignIn event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    // Call the sign-in use case with provided email and password
    final res = await _signinUsecase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    // Emit state based on result of the sign-in attempt
    res.fold(
      (error) => emit(AuthState.failed(error.message)),
      (user) => _emitUserState(user, emit),
    );
  }

  // Handles the sign-up event
  void _signup(_AuthSignUp event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    // Call the sign-up use case with provided user details
    var res = await _signupUsecase(
      SignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );

    // Emit state based on result of the sign-up attempt
    res.fold(
      (error) => emit(AuthState.failed(error.message)),
      (user) => _emitUserState(user, emit),
    );
  }

  // Handles getting current user info
  void _getCurrentUser(_AuthGetUserInfo event, Emitter<AuthState> emit) async {
    // Emit loading state
    emit(const AuthState.loading());

    // Listen to the user stream for authentication state changes
    await _userStreamUsecase().listen((user) async {
      if (user != null) {
        // If a user is found, get their details
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

  // Emits user-related state and updates the app user cubit
  void _emitUserState(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthState.success(user));
  }

  // Handles the sign-out event
  void _signout(_AuthSignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    // Call the sign-out use case
    final res = await _signoutUsecase(NoParams());

    // Emit state based on result of the sign-out attempt
    res.fold(
      (error) => emit(AuthState.failed(error.message)),
      (message) {
        _appUserCubit.updateUser(null);
        emit(const AuthState.signedOut());
      },
    );
  }
}
