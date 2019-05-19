import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/ProductDetailPage/';

  final String title;
  final String imageUrl;

  ProductDetail(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Text(title),
            RaisedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Delete'),
            )
          ],
        ),
      ),
    );
  }
}
