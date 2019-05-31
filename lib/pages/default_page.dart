import 'package:flutter/material.dart';
import 'package:flutter_app/custom_shape/clip_shadow_path.dart';

import 'package:flutter_app/custom_shape/custom_shape_clipper.dart';

class DefaultPage extends StatefulWidget {
//  static const String routeName = '/';
  static const String routeName = '/defaultPage';

  @override
  State<StatefulWidget> createState() {
    return _MyDefaultPageState();
  }
}

class _MyDefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipShadowPath(
                  shadow: Shadow(blurRadius: 5.0, color: Colors.black),
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 250.0,
                    //margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFF47015),
                          Color(0xFFEF772C),
                        ],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 3.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Material(
                            //shadowColor: Colors.cyan,
                            //elevation: 4.0,
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(30.0),
                            child: TextField(
                              controller:
                                  TextEditingController(text: 'New york'),
                              decoration: InputDecoration(
                                //labelText: 'Location',
                                border: InputBorder.none,
                                alignLabelWithHint: true,
                                hintText: 'Location',
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 14.0,
                                ),
                                suffixIcon: Material(
                                  elevation: 2.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: InkWell(
                                    child: Container(
                                      height: 30.0,
                                      width: 30.0,
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onTap: () {
                                      print("0000000000000");
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              width: 300.0,
              height: 250.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.5,
                    spreadRadius: 0.8,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: Container(
                height: 50.0,
                width: 50.0,
                child: Center(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.0, 3.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var shadow = Shadow(blurRadius: 4.0);
    var paint = shadow.toPaint();
    var clipPath = CustomShapeClipper().getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
