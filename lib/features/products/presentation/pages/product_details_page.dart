import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_task/core/extentions/extentions.dart';
import 'package:royal_task/core/theme/app_colors.dart';
import 'package:royal_task/core/theme/app_padding.dart';
import 'package:royal_task/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:royal_task/features/products/domain/entities/product.dart';
import 'package:royal_task/features/products/presentation/painters/background_painter.dart';
import 'package:royal_task/features/products/presentation/widgets/app_bar_action.dart';
import 'package:royal_task/init_dependency.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../blocs/product/product_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Product product =
        serviceLocator<ProductBloc>().getProductById(widget.productId);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: AppPadding.paddingA8,
          child: AppBarAction(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          product.title,
          style: context.textTheme.titleMedium,
        ),
      ),
      bottomNavigationBar: Container(
        padding: AppPadding.paddingA10,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loaded: (cartItems) {
                bool isInCart =
                    cartItems.any((element) => element.productId == product.id);
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      isInCart
                          ? serviceLocator<CartBloc>().add(
                              CartEvent.removeFromCart(productId: product.id))
                          : serviceLocator<CartBloc>()
                              .add(CartEvent.addToCart(product: product));
                    },
                    child: Text(isInCart ? 'In cart' : 'Add to cart'));
              },
            );
          },
        ),
      ),
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                product.category.name,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(product.title),
            ),
            10.sbh,
            Column(
              children: [
                CarouselSlider.builder(
                  itemCount: product.images.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        imageUrl: product.images[index],
                        errorWidget: (context, url, error) {
                          return const SizedBox();
                        },
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    enableInfiniteScroll: false,
                  ),
                ),
                10.sbh,
                AnimatedSmoothIndicator(
                  activeIndex: _selectedIndex,
                  count: product.images.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: context.theme.primaryColor,
                    // ignore: deprecated_member_use
                    dotColor: context.theme.colorScheme.surfaceVariant,
                    dotHeight: 10,
                    expansionFactor: 1.8,
                    dotWidth: 10,
                  ),
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ListTile(
                title: Text(
                  '\$${product.price}',
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const ListTile(
              title: Text(
                'Product Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(product.description),
            )
          ],
        ),
      ),
    );
  }
}
