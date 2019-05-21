import 'package:flutter/material.dart';
import 'custom_shape_clipper.dart';

class DefaultPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _MyDefaultPageState();
  }
}

class _MyDefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: 250.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}
