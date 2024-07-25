// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getHomeData,
    required TResult Function() loadMoreProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getHomeData,
    TResult? Function()? loadMoreProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getHomeData,
    TResult Function()? loadMoreProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHomeData value) getHomeData,
    required TResult Function(_LoadMoreProducts value) loadMoreProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHomeData value)? getHomeData,
    TResult? Function(_LoadMoreProducts value)? loadMoreProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHomeData value)? getHomeData,
    TResult Function(_LoadMoreProducts value)? loadMoreProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHomeDataImplCopyWith<$Res> {
  factory _$$GetHomeDataImplCopyWith(
          _$GetHomeDataImpl value, $Res Function(_$GetHomeDataImpl) then) =
      __$$GetHomeDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRefresh});
}

/// @nodoc
class __$$GetHomeDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeDataImpl>
    implements _$$GetHomeDataImplCopyWith<$Res> {
  __$$GetHomeDataImplCopyWithImpl(
      _$GetHomeDataImpl _value, $Res Function(_$GetHomeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRefresh = null,
  }) {
    return _then(_$GetHomeDataImpl(
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetHomeDataImpl implements _GetHomeData {
  const _$GetHomeDataImpl({required this.isRefresh});

  @override
  final bool isRefresh;

  @override
  String toString() {
    return 'HomeEvent.getHomeData(isRefresh: $isRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHomeDataImpl &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRefresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHomeDataImplCopyWith<_$GetHomeDataImpl> get copyWith =>
      __$$GetHomeDataImplCopyWithImpl<_$GetHomeDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getHomeData,
    required TResult Function() loadMoreProducts,
  }) {
    return getHomeData(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getHomeData,
    TResult? Function()? loadMoreProducts,
  }) {
    return getHomeData?.call(isRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getHomeData,
    TResult Function()? loadMoreProducts,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData(isRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHomeData value) getHomeData,
    required TResult Function(_LoadMoreProducts value) loadMoreProducts,
  }) {
    return getHomeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHomeData value)? getHomeData,
    TResult? Function(_LoadMoreProducts value)? loadMoreProducts,
  }) {
    return getHomeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHomeData value)? getHomeData,
    TResult Function(_LoadMoreProducts value)? loadMoreProducts,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData(this);
    }
    return orElse();
  }
}

abstract class _GetHomeData implements HomeEvent {
  const factory _GetHomeData({required final bool isRefresh}) =
      _$GetHomeDataImpl;

  bool get isRefresh;
  @JsonKey(ignore: true)
  _$$GetHomeDataImplCopyWith<_$GetHomeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreProductsImplCopyWith<$Res> {
  factory _$$LoadMoreProductsImplCopyWith(_$LoadMoreProductsImpl value,
          $Res Function(_$LoadMoreProductsImpl) then) =
      __$$LoadMoreProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreProductsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadMoreProductsImpl>
    implements _$$LoadMoreProductsImplCopyWith<$Res> {
  __$$LoadMoreProductsImplCopyWithImpl(_$LoadMoreProductsImpl _value,
      $Res Function(_$LoadMoreProductsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreProductsImpl implements _LoadMoreProducts {
  const _$LoadMoreProductsImpl();

  @override
  String toString() {
    return 'HomeEvent.loadMoreProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isRefresh) getHomeData,
    required TResult Function() loadMoreProducts,
  }) {
    return loadMoreProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isRefresh)? getHomeData,
    TResult? Function()? loadMoreProducts,
  }) {
    return loadMoreProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isRefresh)? getHomeData,
    TResult Function()? loadMoreProducts,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHomeData value) getHomeData,
    required TResult Function(_LoadMoreProducts value) loadMoreProducts,
  }) {
    return loadMoreProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHomeData value)? getHomeData,
    TResult? Function(_LoadMoreProducts value)? loadMoreProducts,
  }) {
    return loadMoreProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHomeData value)? getHomeData,
    TResult Function(_LoadMoreProducts value)? loadMoreProducts,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreProducts implements HomeEvent {
  const factory _LoadMoreProducts() = _$LoadMoreProductsImpl;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)
        loaded,
    required TResult Function(String message) loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult? Function(String message)? loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult Function(String message)? loadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HomeState.initial()';
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
    required TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)
        loaded,
    required TResult Function(String message) loadFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult? Function(String message)? loadFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult Function(String message)? loadFailed,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
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
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'HomeState.loading()';
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
    required TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)
        loaded,
    required TResult Function(String message) loadFailed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult? Function(String message)? loadFailed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult Function(String message)? loadFailed,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Product> products,
      bool hasMoreProducts,
      List<Category> categories});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? hasMoreProducts = null,
    Object? categories = null,
  }) {
    return _then(_$LoadedImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      hasMoreProducts: null == hasMoreProducts
          ? _value.hasMoreProducts
          : hasMoreProducts // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required final List<Product> products,
      required this.hasMoreProducts,
      required final List<Category> categories})
      : _products = products,
        _categories = categories;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final bool hasMoreProducts;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'HomeState.loaded(products: $products, hasMoreProducts: $hasMoreProducts, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.hasMoreProducts, hasMoreProducts) ||
                other.hasMoreProducts == hasMoreProducts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      hasMoreProducts,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)
        loaded,
    required TResult Function(String message) loadFailed,
  }) {
    return loaded(products, hasMoreProducts, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult? Function(String message)? loadFailed,
  }) {
    return loaded?.call(products, hasMoreProducts, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult Function(String message)? loadFailed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(products, hasMoreProducts, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements HomeState {
  const factory _Loaded(
      {required final List<Product> products,
      required final bool hasMoreProducts,
      required final List<Category> categories}) = _$LoadedImpl;

  List<Product> get products;
  bool get hasMoreProducts;
  List<Category> get categories;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailedImplCopyWith<$Res> {
  factory _$$LoadFailedImplCopyWith(
          _$LoadFailedImpl value, $Res Function(_$LoadFailedImpl) then) =
      __$$LoadFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoadFailedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadFailedImpl>
    implements _$$LoadFailedImplCopyWith<$Res> {
  __$$LoadFailedImplCopyWithImpl(
      _$LoadFailedImpl _value, $Res Function(_$LoadFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoadFailedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadFailedImpl implements _LoadFailed {
  const _$LoadFailedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState.loadFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      __$$LoadFailedImplCopyWithImpl<_$LoadFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)
        loaded,
    required TResult Function(String message) loadFailed,
  }) {
    return loadFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult? Function(String message)? loadFailed,
  }) {
    return loadFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, bool hasMoreProducts,
            List<Category> categories)?
        loaded,
    TResult Function(String message)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadFailed implements HomeState {
  const factory _LoadFailed({required final String message}) = _$LoadFailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
