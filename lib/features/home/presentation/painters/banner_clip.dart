import 'package:flutter/material.dart';
import 'package:royal_task/core/theme/app_colors.dart';

abstract class DiagonalPathBase {
  static const double radius = 20.0;

  static Path createPath(Size size) {
    return Path()
      ..moveTo(0, 20) // Start at the top left corner
      ..lineTo(0, size.height * 0.28) // Move down to 28% of the height
      ..lineTo(
          0,
          size.height -
              radius) // Move straight down, leaving space for bottom radius
      ..quadraticBezierTo(
          0, size.height, radius, size.height - 3) // Bottom left curve
      ..lineTo(size.width - radius,
          size.height * 0.83) // Diagonal line up to the right
      ..quadraticBezierTo(size.width, size.height * 0.8, size.width,
          size.height * 0.8 - radius) // Bottom right curve
      ..lineTo(size.width,
          radius) // Move straight up, leaving space for the top right radius
      ..quadraticBezierTo(
          size.width, 0.1, size.width - radius, 0) // Top right curve
      ..lineTo(radius, 0) // Diagonal line to the left
      ..quadraticBezierTo(0, 0, 0, radius + 5) // Top left curve
      ..close(); // Close the path
  }
}

/// Custom painter for drawing rounded diagonal border
class RoundedDiagonalBorder extends CustomPainter {
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
    final path = DiagonalPathBase.createPath(size);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Custom clipper for creating a rounded diagonal path
class RoundedDiagonalPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return DiagonalPathBase.createPath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
