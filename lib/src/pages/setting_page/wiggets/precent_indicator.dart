import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_tas/src/utils/constants/color.dart';

class MyPainter extends CustomPainter {
  final double precent;

  MyPainter({super.repaint, required this.precent});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = Colors.transparent;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);

    final filedPaint = Paint();
    filedPaint.color = TColors.buttonColorLightBlue;
    filedPaint.style = PaintingStyle.stroke;
    filedPaint.strokeWidth = 20;
    canvas.drawArc(
      const Offset(20.5, 20.5) & Size(size.width - 41, size.height - 41),
      pi * 2 * precent - (pi / 2),
      pi * 2 * (1.0 - precent),
      false,
      filedPaint,
    );

    final feelPaint = Paint();
    feelPaint.color = TColors.containerColorBlue;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = 20;
    feelPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(
      const Offset(20.5, 20.5) & Size(size.width - 41, size.height - 41),
      -pi / 2,
      9.1 * 2 * precent,
      false,
      feelPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
