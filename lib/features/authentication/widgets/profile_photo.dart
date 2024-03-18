import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffBF2FF8).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1077109, size.height * 0.05418899,
                size.width * 0.8907563, size.height * 0.8907563),
            bottomRight: Radius.circular(size.width * 0.3025210),
            bottomLeft: Radius.circular(size.width * 0.3025210),
            topLeft: Radius.circular(size.width * 0.3025210),
            topRight: Radius.circular(size.width * 0.3025210)),
        paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff40CEF2).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * -0.1176471, size.height * 0.5046134,
                size.width * 0.8739496, size.height * 0.8739496),
            bottomRight: Radius.circular(size.width * 0.3025210),
            bottomLeft: Radius.circular(size.width * 0.3025210),
            topLeft: Radius.circular(size.width * 0.3025210),
            topRight: Radius.circular(size.width * 0.3025210)),
        paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.1053563, size.height * 0.1053555,
                size.width * 0.8403361, size.height * 0.8403361),
            bottomRight: Radius.circular(size.width * 0.3025210),
            bottomLeft: Radius.circular(size.width * 0.3025210),
            topLeft: Radius.circular(size.width * 0.3025210),
            topRight: Radius.circular(size.width * 0.3025210)),
        paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
