import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_padding.dart';
import '../../../../core/theme/app_radius.dart';
import '../../domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.index, required this.category});
  final int index;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.radiusC10,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 50,
          sigmaY: 50,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.gradient4.withOpacity(0.4),
              AppColors.gradient5.withOpacity(0.4),
            ], begin: Alignment.topCenter),
            borderRadius: AppRadius.radiusC10,
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          padding: AppPadding.paddingA10,
          width: 60,
          height: 60,
          child: CachedNetworkImage(
            imageUrl: category.image,
            errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },
          ),
        ),
      ),
    );
  }
}
