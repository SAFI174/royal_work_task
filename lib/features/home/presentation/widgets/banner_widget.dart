import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:royal_task/core/extentions/extentions.dart';

import '../../../../core/constants.dart';
import '../painters/banner_clip.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomPaint(
          painter: RoundedDiagonalBorder(),
          child: ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 100,
                sigmaY: 100,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: CachedNetworkImage(
                    imageUrl: bannerImage,
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error);
                    },
                  )),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      '30 % OFF',
                      style: context.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
