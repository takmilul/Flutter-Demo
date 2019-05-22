import 'package:flutter/material.dart';
import 'custom_shape_clipper.dart';

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
      body: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: 250.0,
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
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyan,
                      offset: Offset(0, 0.5),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Material(
                  //shadowColor: Colors.cyan,
                  //elevation: 4.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: TextField(
                    controller: TextEditingController(text: 'New york'),
                    decoration: InputDecoration(
                      //labelText: 'Location',
                      border: InputBorder.none,
                      alignLabelWithHint: true,
                      hintText: 'Location',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 14.0,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          print("0000000000000");
                        },
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(30.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
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
    );
  }
}
