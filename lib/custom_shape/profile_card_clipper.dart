import 'package:flutter/material.dart';

class ProfileCardClipper extends CustomClipper<Path>{
  final BuildContext context;
  
  ProfileCardClipper(this.context);
  
  @override
  Path getClip(Size size) {
    final Path path = Path();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    
    path.lineTo(5.0, 5.0);
    path.lineTo(size.width/2 - 43, 5.0);
    
    var firstControlPoint = Offset(size.width/2-40, 62.0);
    var firstEndPoint = Offset(size.width/2, 42);
    //path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    
    var secondControlPoint = Offset(size.width/2+40, 62.0);
    var secondEndPoint = Offset(size.width/2+43, 5.0);
    //path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    
    path.cubicTo(firstControlPoint.dx, firstControlPoint.dy, secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    
    path.lineTo(size.width-5, 5.0);
    path.lineTo(size.width-5, size.height-5);
    path.lineTo(5.0, size.height-5);
    path.lineTo(5.0, 5.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}