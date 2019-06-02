import 'package:flutter/material.dart';
import 'package:flutter_app/custom_shape/clip_shadow_path.dart';
import 'package:flutter_app/custom_shape/profile_card_clipper.dart';
import 'package:flutter_app/pages/product_page.dart';

class AuthPage extends StatefulWidget {
//  static const routeName = '/authPage';
  static const String routeName = '/';
  final Function addProduct;
  final Function deleteProduct;

  AuthPage(this.addProduct, this.deleteProduct);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  bool isAgreed = false;

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
            child: Stack(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(top: 50.0, bottom: 10, left: 2, right: 2),
                  child: ClipShadowPath(
                    shadow: Shadow(
                        color: Colors.black54,
                        blurRadius: 3.0,
                        offset: Offset(0.0, 0.5)),
                    clipper: ProfileCardClipper(context),
                    child: buildLoginCard(context),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: deviceWidth / 2 - 45,
                  child: buildAvatar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildLoginCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Color(0xFF414457),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(1.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
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
            color: Colors.white,
            child: Text("Login"),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, ProductPage.routeName),
          ),
        ],
      ),
    );
  }

  Container buildAvatar() {
    return Container(
      height: 70.0,
      width: 70.0,
      //margin: EdgeInsets.only(top: 100.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/PP.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFF414457),
          width: 2.0,
          style: BorderStyle.solid,
        ),
        color: Color(0xFF414457),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, 0.5),
          ),
        ],
      ),
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/food.jpg'),
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
    );
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
        style: TextStyle(color: Colors.white),
      ),
      value: isAgreed,
      onChanged: (bool value) {
        setState(() {
          isAgreed = value;
        });
      },
    );
  }
}
