import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 400.0 : deviceWidth * 0.9;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
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
        ),
      ),
    );
  }

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Title'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required field';
        }
      },
      onSaved: (String value) {
        setState(
          () {
            titleText = value;
          },
        );
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required field';
        }
      },
      maxLines: 4,
      onSaved: (String value) {
        setState(
          () {
            descriptionText = value;
          },
        );
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Required field';
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value) {
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
        setState(
          () {
            isAgreed = value;
          },
        );
      },
    );
  }

  void _createProduct() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Fluttertoast.showToast(msg: 'field required');
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
