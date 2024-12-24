import 'package:flutter/material.dart';
import 'package:svg_path_parser/svg_path_parser.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Helper function to scale paths to fit the canvas
    Path transformPath(String pathData) {
      final path = parseSvgPath(pathData);
      final matrix = Matrix4.identity()
        ..scale(size.width / 1080, size.height / 1080); // Adjust scaling based on viewBox
      return path.transform(matrix.storage);
    }

    // Paint definitions
    final fillPaint = Paint()
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Draw paths
    fillPaint.color = const Color(0xFFE5E5E5);
    canvas.drawPath(
        transformPath(
            "M590.84 242.27H877.06C880.922 242.27 884.625 243.804 887.355 246.535C890.086 249.265 891.62 252.968 891.62 256.83V543C891.62 546.862 890.086 550.565 887.355 553.295C884.625 556.026 880.922 557.56 877.06 557.56H805.37C744.62 557.56 686.358 533.431 643.397 490.479C600.435 447.527 576.293 389.27 576.28 328.52V256.83C576.28 252.968 577.814 249.265 580.545 246.535C583.275 243.804 586.978 242.27 590.84 242.27Z"),
        fillPaint);

    fillPaint.color = const Color(0xFFE2E2E2);
    canvas.drawPath(
        transformPath(
            "M270.444 736.1C275.627 720.148 266.897 703.015 250.945 697.832C234.993 692.649 217.86 701.378 212.677 717.33C207.494 733.282 216.224 750.416 232.176 755.599C248.128 760.782 265.261 752.052 270.444 736.1Z"),
        fillPaint);

    canvas.drawPath(
        transformPath(
            "M320.604 675.4C323.104 667.705 318.893 659.44 311.198 656.94C303.503 654.44 295.238 658.651 292.738 666.346C290.238 674.041 294.449 682.306 302.144 684.806C309.839 687.306 318.104 683.095 320.604 675.4Z"),
        fillPaint);

    strokePaint.color = const Color(0xFF0E0E0E);
    canvas.drawPath(
        transformPath(
            "M220.94 658.42L182.76 630.24"),
        strokePaint);

    canvas.drawPath(
        transformPath(
            "M235.32 647.7L228.22 634.87"),
        strokePaint);

    canvas.drawPath(
        transformPath(
            "M250.88 643.74L254.21 605.75"),
        strokePaint);

    canvas.drawPath(
        transformPath(
            "M391.35 766.91C443 684.73 495.94 512.78 505.11 412.34C505.282 404.783 508.398 397.591 513.794 392.298C519.191 387.004 526.441 384.027 534 384V384C541.665 384 549.016 387.045 554.435 392.465C559.855 397.884 562.9 405.235 562.9 412.9V714.26C552.9 758.54 534.99 800.12 477.08 801.67L453.67 840.88"),
        strokePaint);

    canvas.drawPath(
        transformPath(
            "M507.52 656.43V558.58C507.52 551.236 510.437 544.193 515.63 539C520.823 533.807 527.866 530.89 535.21 530.89C538.846 530.89 542.447 531.606 545.807 532.998C549.166 534.389 552.219 536.429 554.79 539C557.361 541.572 559.401 544.624 560.792 547.984C562.184 551.343 562.9 554.944 562.9 558.58V656.42"),
        strokePaint);

    fillPaint.color = const Color(0xFFE5E5E5);
    canvas.drawPath(
        transformPath(
            "M370.77 769.02L463.36 878.91L434.95 912.74L337.49 797.06L370.77 769.02Z"),
        fillPaint);

    strokePaint.color = const Color(0xFF0E0E0E);
    canvas.drawPath(
        transformPath(
            "M370.77 742.49L463.36 852.38L434.95 886.21L337.49 770.53L370.77 742.49Z"),
        strokePaint);

    // Add other paths similarly...

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}