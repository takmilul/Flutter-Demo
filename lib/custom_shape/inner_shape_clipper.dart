import 'package:flutter/material.dart';

class InnerShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
  
}