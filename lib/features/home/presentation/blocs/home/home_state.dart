part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.loaded({
    required List<Product> products,
    required bool hasMoreProducts,
    required List<Category> categories,
  }) = _Loaded;

  const factory HomeState.loadFailed({required String message}) = _LoadFailed;
}
