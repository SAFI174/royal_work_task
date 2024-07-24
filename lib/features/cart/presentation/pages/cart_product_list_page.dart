import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_task/core/widgets/loader_widget.dart';
import 'package:royal_task/init_dependency.dart';
import 'dart:developer';
import '../bloc/cart/cart_bloc.dart';

class CartProductListPage extends StatelessWidget {
  const CartProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartBloc>().add(const CartEvent.clearCart());
            },
            icon: const Icon(Icons.delete_outline),
          )
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) => log(message),
            loaded: (message) => log(message.length.toString()),
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            error: (message) => Text(message),
            loading: () => const Loader(),
            loaded: (cartItems) {
              if (cartItems.isEmpty) {
                return const Center(child: Text('Cart is empty'));
              }
              return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: cartItem.image,
                      width: 60,
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error);
                      },
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        serviceLocator<CartBloc>().add(
                          CartEvent.removeFromCart(
                            productId: cartItem.productId,
                          ),
                        );
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    title: Text(cartItem.title),
                    subtitle: Text(
                      '\$${cartItem.price} | x${cartItem.quantity}',
                    ),
                  );
                },
              );
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
