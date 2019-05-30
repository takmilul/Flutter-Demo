import 'package:flutter/material.dart';
import 'package:flutter_app/custom_shape/clip_shadow_path.dart';
import 'package:flutter_app/custom_shape/custom_shape_clipper.dart';
import 'package:flutter_app/custom_shape/profile_card_clipper.dart';
import 'package:flutter_app/pages/product_page.dart';

class AuthPage extends StatelessWidget {
//  static const routeName = '/authPage';
  static const String routeName = '/';
  final bool isAgreed = false;
  final Function addProduct;
  final Function deleteProduct;

  AuthPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 400.0 : deviceWidth * 0.9;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: ClipShadowPath(
              shadow: Shadow(blurRadius: 4.0),
              clipper: ProfileCardClipper(),
              child: Container(
                padding: EdgeInsets.only(top: 80.0, left: 10.0, right: 10.0, bottom: 10.0),
                width: targetWidth,
                color: Color(0xFF414457),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      child: Text("Login"),
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, ProductPage.routeName),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage('assets/food.jpg'),
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop));
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text(
        'Agree',
        style: TextStyle(color: Colors.black),
      ),
      value: isAgreed,
      onChanged: (bool value) {},
    );
  }
}
