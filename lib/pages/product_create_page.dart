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
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 400.0 : deviceWidth * 0.9;
    final double targetPadding = deviceWidth - targetWidth;
    
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          _buildSwitch(),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text('Save'),
            onPressed: _createProduct,
          ),
          /*GestureDetector(
            onTap: _createProduct,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(6.0),
              color: Theme.of(context).primaryColor,
              child: Text('My Button'),
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Title'),
      onChanged: (String value) {
        setState(
          () {
            titleText = value;
          },
        );
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Description'),
      maxLines: 4,
      onChanged: (String value) {
        setState(
          () {
            descriptionText = value;
          },
        );
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Price'),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        setState(
          () {
            priceText = double.parse(value);
          },
        );
      },
    );
  }

  Widget _buildSwitch() {
    return SwitchListTile(
      title: Text('Do you agree?'),
      value: isAgreed,
      onChanged: (bool value) {
        setState(() {
          isAgreed = value;
        });
      },
    );
  }

  void _createProduct() {
    final Map<String, dynamic> product = {
      'title': titleText,
      'description': descriptionText,
      'address': 'Mirpur, Dhaka, Bangladesh',
      'price': priceText,
      'imageUrl': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, ProductPage.routeName);
  }
}
