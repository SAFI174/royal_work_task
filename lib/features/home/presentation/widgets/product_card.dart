import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_task/core/app_router.dart';
import 'package:royal_task/core/extentions/extentions.dart';
import 'package:royal_task/core/theme/app_colors.dart';
import 'package:royal_task/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:royal_task/features/home/domain/entities/product.dart';

import '../../../../init_dependency.dart';
import '../painters/product_clip.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              context.pushNamed(
                AppRoutes.productDetails.name,
                pathParameters: {
                  'id': product.id.toString(),
                },
              );
            },
            child: CustomPaint(
              painter: GlassCardBorder(),
              child: ClipPath(
                clipper: GlassCardClipper(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColors.gradient4.withOpacity(0.5),
                        AppColors.gradient5.withOpacity(0.5),
                      ], begin: Alignment.topCenter),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CachedNetworkImage(
                            height: 110,
                            imageUrl: product.images.first,
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                        10.sbh,
                        Text(
                          product.category.name,
                          style: context.textTheme.labelSmall!.copyWith(
                            color: AppColors.greyColor50,
                          ),
                        ),
                        Text(
                          product.title,
                          style: context.textTheme.labelLarge!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${product.price}',
                          style: context.textTheme.labelLarge!.copyWith(
                            color: AppColors.greyColor50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 5,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final isInCart = state.maybeWhen(
                loaded: (cartItems) {
                  return cartItems
                      .any((element) => element.productId == product.id);
                },
                orElse: () => false,
              );
              return IconButton(
                onPressed: () {
                  isInCart
                      ? serviceLocator<CartBloc>()
                          .add(CartEvent.removeFromCart(productId: product.id))
                      : serviceLocator<CartBloc>()
                          .add(CartEvent.addToCart(product: product));
                },
                icon: Icon(
                  isInCart
                      ? Icons.shopping_cart_rounded
                      : Icons.shopping_cart_outlined,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
