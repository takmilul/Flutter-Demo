import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_page.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/';
  final bool isAgreed = false;
  final Function addProduct;
  final Function deleteProduct;

  AuthPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/food.jpg'),
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop)),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Username', filled: true, fillColor: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Password', filled: true, fillColor: Colors.white),
                ),
                SwitchListTile(
                  title: Text(
                    'Agree',
                    style: TextStyle(color: Colors.black),
                  ),
                  value: isAgreed,
                  onChanged: (bool value) {
                    
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        ProductPage.routeName,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
