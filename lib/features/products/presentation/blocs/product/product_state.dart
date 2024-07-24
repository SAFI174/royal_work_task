part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.loaded(
      {required List<Product> products, required bool hasMore}) = _Loaded;

  const factory ProductState.loadFailed({required String message}) =
      _LoadFailed;
}
