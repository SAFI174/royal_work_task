import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_task/core/extentions/extentions.dart';
import 'package:royal_task/core/theme/app_padding.dart';

import '../../../../core/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.productDetails.name,
            pathParameters: {'id': product.id.toString()});
      },
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: AppPadding.paddingA15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: product.images.first),
              10.sbh,
              Text(
                product.category.name,
                style: context.textTheme.labelMedium!
                    .copyWith(color: AppColors.greyColor),
              ),
              Text(
                product.title,
                style: context.textTheme.titleMedium!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${product.price}',
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
