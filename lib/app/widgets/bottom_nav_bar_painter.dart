import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/app_colors.dart';

class NavBarPainter extends CustomPainter {
  final double radius;

  NavBarPainter(
    this.radius,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.strokeWidth = 3.7;
    paint.color = AppColors.white.withOpacity(0.2);
    paint.style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
