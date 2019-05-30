import 'package:flutter/material.dart';

class ProfileCardClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final Path path = Path();
    var width = size.width;
    var height = size.height;
    path.lineTo(size.width/2 - 40, 0.0);
    
    var firstControlPoint = Offset(size.width/2-40, 40);
    var firstEndPoint = Offset(size.width/2, 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    
    /*var secondControlPoint = Offset(size.width * 0.65, 60);
    var secondEndPoint = Offset(size.width * 0.60, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);*/
    
    path.lineTo(size.width * 0.5, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}