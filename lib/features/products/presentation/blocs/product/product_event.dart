part of 'product_bloc.dart';


@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getProducts({required bool isRefresh}) = _GetProducts;
  const factory ProductEvent.loadMoreProducts() = _LoadMoreProducts;
}