import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_task/core/app_router.dart';
import 'package:royal_task/core/extentions/extentions.dart';
import 'package:royal_task/core/theme/app_colors.dart';
import 'package:royal_task/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:royal_task/features/products/domain/entities/product.dart';

import '../../../../init_dependency.dart';

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
              context.pushNamed(AppRoutes.productDetails.name,
                  pathParameters: {'id': product.id.toString()});
            },
            child: CustomPaint(
              painter: GlassCardPaint(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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

class GlassCardPaint extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  GlassCardPaint({
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final glassPaint = Paint()
      ..color = AppColors.backgroundColor.withAlpha(130)
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 20);

    final borderPaint = Paint()
      ..color = borderColor.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    const double radius = 20.0;

    final path = Path()
      ..moveTo(0, size.height * 0.28)
      ..lineTo(0, size.height - radius)
      ..quadraticBezierTo(0, size.height, radius, size.height - 3)
      ..lineTo(size.width - radius, size.height * 0.83)
      ..quadraticBezierTo(
          size.width, size.height * 0.8, size.width, size.height * 0.8 - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0.1, size.width - radius, 4)
      ..lineTo(radius, size.height * 0.2)
      ..quadraticBezierTo(
          0, size.height * 0.23, 0, size.height * 0.2 + radius + 5);

    // Draw the glass effect
    canvas.drawPath(path, glassPaint);

    // Draw the border

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
