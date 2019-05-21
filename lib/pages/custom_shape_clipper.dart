import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    
    var firstEndPoint = Offset(size.width * 0.5, size.height - 35.0);
    var firstControlPoint = Offset(size.width * 0.20, size.height - 60.0);
    
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * 0.85, size.height - 25.0);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}