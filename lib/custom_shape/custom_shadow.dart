import 'package:flutter/material.dart';

class CustomShadow extends StatelessWidget {
  final Shadow shadow;
  final Widget child;
  
  CustomShadow({@required this.shadow, @required this.child,});
  
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomShadowPainter(shadow: shadow, child: child),
      child: child,
    );
  }
}

class CustomShadowPainter extends CustomPainter {
  final Shadow shadow;
  final Widget child;
  
  CustomShadowPainter({@required this.shadow, @required this.child});
  
  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    canvas.drawPaint(paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
