import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_page.dart';

class ProductCreatePage extends StatefulWidget {
  static const routeName = '/ProductCreatePage';
  final Function addProduct;
  final Function deleteProduct;
  
  ProductCreatePage(this.addProduct, this.deleteProduct);
  
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleText;
  String descriptionText;
  double priceText;
  bool isAgreed = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            onChanged: (String value) {
              setState(
                  () {
                  titleText = value;
                },
              );
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 4,
            onChanged: (String value) {
              setState(
                  () {
                  descriptionText = value;
                },
              );
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(
                  () {
                  priceText = double.parse(value);
                },
              );
            },
          ),
          SwitchListTile(
            title: Text('Do you agree?'),
            value: isAgreed,
            onChanged: (bool value) {
              setState(() {
                isAgreed = value;
              });
            },
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text('Save'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': titleText,
                'description': descriptionText,
                'price': priceText,
                'imageUrl': 'assets/food.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, ProductPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
