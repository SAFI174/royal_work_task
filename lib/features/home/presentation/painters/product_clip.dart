import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

abstract class GlassCardPath {
  static const double radius = 20.0;

  static Path createPath(Size size) {
    return Path()
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
  }
}

/// Custom painter for drawing a glass card border
class GlassCardBorder extends CustomPainter {
  final Gradient _gradient = LinearGradient(
    colors: [
      AppColors.greyColor.withOpacity(0.2),
      AppColors.gradient4.withOpacity(0.5)
    ], // Define your gradient colors
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..shader =
          _gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final path = GlassCardPath.createPath(size);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Custom clipper for creating a glass card clip
class GlassCardClipper extends CustomClipper<Path> {
  final Color borderColor;
  final double borderWidth;

  GlassCardClipper({
    this.borderColor = AppColors.greyColor,
    this.borderWidth = 2.0,
  });

  @override
  Path getClip(Size size) {
    return GlassCardPath.createPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
