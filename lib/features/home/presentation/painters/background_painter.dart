import 'package:flutter/material.dart';
import 'package:royal_task/core/theme/app_colors.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.gradient1, AppColors.gradient2],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    Path path = Path();
    path.moveTo(size.width * 0.62, size.height * 0.24);
    path.lineTo(size.width * 0.82, 0);
    path.lineTo(size.width, size.height * 0.09);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height * 1);
    path.lineTo(size.width * 0.62, size.height * 0.24);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
