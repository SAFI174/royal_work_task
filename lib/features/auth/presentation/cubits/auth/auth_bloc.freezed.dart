// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) authSignin,
    required TResult Function(String name, String email, String password)
        authSignup,
    required TResult Function() signOut,
    required TResult Function() getUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? authSignin,
    TResult? Function(String name, String email, String password)? authSignup,
    TResult? Function()? signOut,
    TResult? Function()? getUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? authSignin,
    TResult Function(String name, String email, String password)? authSignup,
    TResult Function()? signOut,
    TResult Function()? getUserInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSignIn value) authSignin,
    required TResult Function(_AuthSignUp value) authSignup,
    required TResult Function(_AuthSignOut value) signOut,
    required TResult Function(_AuthGetUserInfo value) getUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSignIn value)? authSignin,
    TResult? Function(_AuthSignUp value)? authSignup,
    TResult? Function(_AuthSignOut value)? signOut,
    TResult? Function(_AuthGetUserInfo value)? getUserInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSignIn value)? authSignin,
    TResult Function(_AuthSignUp value)? authSignup,
    TResult Function(_AuthSignOut value)? signOut,
    TResult Function(_AuthGetUserInfo value)? getUserInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthSignInImplCopyWith<$Res> {
  factory _$$AuthSignInImplCopyWith(
          _$AuthSignInImpl value, $Res Function(_$AuthSignInImpl) then) =
      __$$AuthSignInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthSignInImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignInImpl>
    implements _$$AuthSignInImplCopyWith<$Res> {
  __$$AuthSignInImplCopyWithImpl(
      _$AuthSignInImpl _value, $Res Function(_$AuthSignInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthSignInImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignInImpl implements _AuthSignIn {
  const _$AuthSignInImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.authSignin(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignInImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignInImplCopyWith<_$AuthSignInImpl> get copyWith =>
      __$$AuthSignInImplCopyWithImpl<_$AuthSignInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) authSignin,
    required TResult Function(String name, String email, String password)
        authSignup,
    required TResult Function() signOut,
    required TResult Function() getUserInfo,
  }) {
    return authSignin(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? authSignin,
    TResult? Function(String name, String email, String password)? authSignup,
    TResult? Function()? signOut,
    TResult? Function()? getUserInfo,
  }) {
    return authSignin?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? authSignin,
    TResult Function(String name, String email, String password)? authSignup,
    TResult Function()? signOut,
    TResult Function()? getUserInfo,
    required TResult orElse(),
  }) {
    if (authSignin != null) {
      return authSignin(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSignIn value) authSignin,
    required TResult Function(_AuthSignUp value) authSignup,
    required TResult Function(_AuthSignOut value) signOut,
    required TResult Function(_AuthGetUserInfo value) getUserInfo,
  }) {
    return authSignin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSignIn value)? authSignin,
    TResult? Function(_AuthSignUp value)? authSignup,
    TResult? Function(_AuthSignOut value)? signOut,
    TResult? Function(_AuthGetUserInfo value)? getUserInfo,
  }) {
    return authSignin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSignIn value)? authSignin,
    TResult Function(_AuthSignUp value)? authSignup,
    TResult Function(_AuthSignOut value)? signOut,
    TResult Function(_AuthGetUserInfo value)? getUserInfo,
    required TResult orElse(),
  }) {
    if (authSignin != null) {
      return authSignin(this);
    }
    return orElse();
  }
}

abstract class _AuthSignIn implements AuthEvent {
  const factory _AuthSignIn(
      {required final String email,
      required final String password}) = _$AuthSignInImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthSignInImplCopyWith<_$AuthSignInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignUpImplCopyWith<$Res> {
  factory _$$AuthSignUpImplCopyWith(
          _$AuthSignUpImpl value, $Res Function(_$AuthSignUpImpl) then) =
      __$$AuthSignUpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String email, String password});
}

/// @nodoc
class __$$AuthSignUpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignUpImpl>
    implements _$$AuthSignUpImplCopyWith<$Res> {
  __$$AuthSignUpImplCopyWithImpl(
      _$AuthSignUpImpl _value, $Res Function(_$AuthSignUpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthSignUpImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignUpImpl implements _AuthSignUp {
  const _$AuthSignUpImpl(
      {required this.name, required this.email, required this.password});

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.authSignup(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignUpImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignUpImplCopyWith<_$AuthSignUpImpl> get copyWith =>
      __$$AuthSignUpImplCopyWithImpl<_$AuthSignUpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) authSignin,
    required TResult Function(String name, String email, String password)
        authSignup,
    required TResult Function() signOut,
    required TResult Function() getUserInfo,
  }) {
    return authSignup(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? authSignin,
    TResult? Function(String name, String email, String password)? authSignup,
    TResult? Function()? signOut,
    TResult? Function()? getUserInfo,
  }) {
    return authSignup?.call(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? authSignin,
    TResult Function(String name, String email, String password)? authSignup,
    TResult Function()? signOut,
    TResult Function()? getUserInfo,
    required TResult orElse(),
  }) {
    if (authSignup != null) {
      return authSignup(name, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSignIn value) authSignin,
    required TResult Function(_AuthSignUp value) authSignup,
    required TResult Function(_AuthSignOut value) signOut,
    required TResult Function(_AuthGetUserInfo value) getUserInfo,
  }) {
    return authSignup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSignIn value)? authSignin,
    TResult? Function(_AuthSignUp value)? authSignup,
    TResult? Function(_AuthSignOut value)? signOut,
    TResult? Function(_AuthGetUserInfo value)? getUserInfo,
  }) {
    return authSignup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSignIn value)? authSignin,
    TResult Function(_AuthSignUp value)? authSignup,
    TResult Function(_AuthSignOut value)? signOut,
    TResult Function(_AuthGetUserInfo value)? getUserInfo,
    required TResult orElse(),
  }) {
    if (authSignup != null) {
      return authSignup(this);
    }
    return orElse();
  }
}

abstract class _AuthSignUp implements AuthEvent {
  const factory _AuthSignUp(
      {required final String name,
      required final String email,
      required final String password}) = _$AuthSignUpImpl;

  String get name;
  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthSignUpImplCopyWith<_$AuthSignUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignOutImplCopyWith<$Res> {
  factory _$$AuthSignOutImplCopyWith(
          _$AuthSignOutImpl value, $Res Function(_$AuthSignOutImpl) then) =
      __$$AuthSignOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSignOutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignOutImpl>
    implements _$$AuthSignOutImplCopyWith<$Res> {
  __$$AuthSignOutImplCopyWithImpl(
      _$AuthSignOutImpl _value, $Res Function(_$AuthSignOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthSignOutImpl implements _AuthSignOut {
  const _$AuthSignOutImpl();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSignOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) authSignin,
    required TResult Function(String name, String email, String password)
        authSignup,
    required TResult Function() signOut,
    required TResult Function() getUserInfo,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? authSignin,
    TResult? Function(String name, String email, String password)? authSignup,
    TResult? Function()? signOut,
    TResult? Function()? getUserInfo,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? authSignin,
    TResult Function(String name, String email, String password)? authSignup,
    TResult Function()? signOut,
    TResult Function()? getUserInfo,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSignIn value) authSignin,
    required TResult Function(_AuthSignUp value) authSignup,
    required TResult Function(_AuthSignOut value) signOut,
    required TResult Function(_AuthGetUserInfo value) getUserInfo,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSignIn value)? authSignin,
    TResult? Function(_AuthSignUp value)? authSignup,
    TResult? Function(_AuthSignOut value)? signOut,
    TResult? Function(_AuthGetUserInfo value)? getUserInfo,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSignIn value)? authSignin,
    TResult Function(_AuthSignUp value)? authSignup,
    TResult Function(_AuthSignOut value)? signOut,
    TResult Function(_AuthGetUserInfo value)? getUserInfo,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _AuthSignOut implements AuthEvent {
  const factory _AuthSignOut() = _$AuthSignOutImpl;
}

/// @nodoc
abstract class _$$AuthGetUserInfoImplCopyWith<$Res> {
  factory _$$AuthGetUserInfoImplCopyWith(_$AuthGetUserInfoImpl value,
          $Res Function(_$AuthGetUserInfoImpl) then) =
      __$$AuthGetUserInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthGetUserInfoImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthGetUserInfoImpl>
    implements _$$AuthGetUserInfoImplCopyWith<$Res> {
  __$$AuthGetUserInfoImplCopyWithImpl(
      _$AuthGetUserInfoImpl _value, $Res Function(_$AuthGetUserInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthGetUserInfoImpl implements _AuthGetUserInfo {
  const _$AuthGetUserInfoImpl();

  @override
  String toString() {
    return 'AuthEvent.getUserInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthGetUserInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) authSignin,
    required TResult Function(String name, String email, String password)
        authSignup,
    required TResult Function() signOut,
    required TResult Function() getUserInfo,
  }) {
    return getUserInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? authSignin,
    TResult? Function(String name, String email, String password)? authSignup,
    TResult? Function()? signOut,
    TResult? Function()? getUserInfo,
  }) {
    return getUserInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? authSignin,
    TResult Function(String name, String email, String password)? authSignup,
    TResult Function()? signOut,
    TResult Function()? getUserInfo,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthSignIn value) authSignin,
    required TResult Function(_AuthSignUp value) authSignup,
    required TResult Function(_AuthSignOut value) signOut,
    required TResult Function(_AuthGetUserInfo value) getUserInfo,
  }) {
    return getUserInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthSignIn value)? authSignin,
    TResult? Function(_AuthSignUp value)? authSignup,
    TResult? Function(_AuthSignOut value)? signOut,
    TResult? Function(_AuthGetUserInfo value)? getUserInfo,
  }) {
    return getUserInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthSignIn value)? authSignin,
    TResult Function(_AuthSignUp value)? authSignup,
    TResult Function(_AuthSignOut value)? signOut,
    TResult Function(_AuthGetUserInfo value)? getUserInfo,
    required TResult orElse(),
  }) {
    if (getUserInfo != null) {
      return getUserInfo(this);
    }
    return orElse();
  }
}

abstract class _AuthGetUserInfo implements AuthEvent {
  const factory _AuthGetUserInfo() = _$AuthGetUserInfoImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(User user) success,
    required TResult Function() signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(User user)? success,
    TResult? Function()? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(User user)? success,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
    required TResult Function(_SingedOut value) signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
    TResult? Function(_SingedOut value)? signedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    TResult Function(_SingedOut value)? signedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(User user) success,
    required TResult Function() signedOut,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(User user)? success,
    TResult? Function()? signedOut,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(User user)? success,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
    required TResult Function(_SingedOut value) signedOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
    TResult? Function(_SingedOut value)? signedOut,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    TResult Function(_SingedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(User user) success,
    required TResult Function() signedOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(User user)? success,
    TResult? Function()? signedOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(User user)? success,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
    required TResult Function(_SingedOut value) signedOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
    TResult? Function(_SingedOut value)? signedOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    TResult Function(_SingedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(User user) success,
    required TResult Function() signedOut,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(User user)? success,
    TResult? Function()? signedOut,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(User user)? success,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
    required TResult Function(_SingedOut value) signedOut,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
    TResult? Function(_SingedOut value)? signedOut,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    TResult Function(_SingedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements AuthState {
  const factory _Failed(final String message) = _$FailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$SuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(User user) success,
    required TResult Function() signedOut,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(User user)? success,
    TResult? Function()? signedOut,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(User user)? success,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
    required TResult Function(_SingedOut value) signedOut,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
    TResult? Function(_SingedOut value)? signedOut,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    TResult Function(_SingedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements AuthState {
  const factory _Success(final User user) = _$SuccessImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingedOutImplCopyWith<$Res> {
  factory _$$SingedOutImplCopyWith(
          _$SingedOutImpl value, $Res Function(_$SingedOutImpl) then) =
      __$$SingedOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingedOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SingedOutImpl>
    implements _$$SingedOutImplCopyWith<$Res> {
  __$$SingedOutImplCopyWithImpl(
      _$SingedOutImpl _value, $Res Function(_$SingedOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SingedOutImpl implements _SingedOut {
  const _$SingedOutImpl();

  @override
  String toString() {
    return 'AuthState.signedOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SingedOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) failed,
    required TResult Function(User user) success,
    required TResult Function() signedOut,
  }) {
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? failed,
    TResult? Function(User user)? success,
    TResult? Function()? signedOut,
  }) {
    return signedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? failed,
    TResult Function(User user)? success,
    TResult Function()? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Success value) success,
    required TResult Function(_SingedOut value) signedOut,
  }) {
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Success value)? success,
    TResult? Function(_SingedOut value)? signedOut,
  }) {
    return signedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failed value)? failed,
    TResult Function(_Success value)? success,
    TResult Function(_SingedOut value)? signedOut,
    required TResult orElse(),
  }) {
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class _SingedOut implements AuthState {
  const factory _SingedOut() = _$SingedOutImpl;
}
