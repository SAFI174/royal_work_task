part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;

  const factory CartEvent.addToCart({required Product product}) = _AddToCart;

  const factory CartEvent.clearCart() = _ClearCart;

  const factory CartEvent.getCartItems() = _GetCartItems;

  const factory CartEvent.removeFromCart({required int productId}) =
      _RemoveFromCart;
}
