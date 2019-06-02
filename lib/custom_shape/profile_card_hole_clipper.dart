import 'package:flutter/material.dart';

class ProfileCardHoleClipper extends CustomClipper<Path>{
  final BuildContext context;

  ProfileCardHoleClipper(this.context);
  
  @override
  Path getClip(Size size) {
    final Path path = Path();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    
    path.lineTo(5.0, 5.0);
    
    //path.addOval(Rect.fromCircle(center: Offset(size.width, size.height), radius: 43.0,));
    path.addOval(Rect.fromLTWH(size.width / 2, size.height / 2, size.width / 4, size.height / 4));
    
    
    path.lineTo(5.0, 5.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}