import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/products/address_tag.dart';
import 'package:flutter_app/widgets/ui_elements/title_default.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/ProductDetailPage/';

  final String title;
  final String imageUrl;
  final String address;

  ProductDetail(this.title, this.imageUrl, this.address);

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
            SizedBox(height: 8.0,),
            TitleDefault(title),
            AddressTag(address),
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
