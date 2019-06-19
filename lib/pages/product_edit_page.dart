import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:flutter_app/widgets/helpers/ensure_visible.dart';

class ProductEditPage extends StatefulWidget {
  static const routeName = '/ProductCreatePage';
  final int index;
  final Map<String, dynamic> product;
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;

  ProductEditPage({this.index, this.product, this.addProduct, this.updateProduct, this.deleteProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  String titleText;
  String descriptionText;
  double priceText;
  bool isAgreed = false;
  final Map<String, dynamic> product = {
    'title': null,
    'description': null,
    'address': 'Mirpur, Dhaka, Bangladesh',
    'price': null,
    'imageUrl': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 400.0 : deviceWidth * 0.9;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
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
                onPressed: _saveProduct,
              ),
            ],
          ),
        ),
      ),
    );
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }

  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        initialValue: widget.product != null ? widget.product['title'] : "",
        decoration: InputDecoration(labelText: 'Title'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'title is required';
          }
        },
        onSaved: (String value) {
          product['title'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        initialValue: widget.product != null ? widget.product['description'] : "",
        decoration: InputDecoration(labelText: 'Description'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Description is required';
          }
        },
        maxLines: 4,
        onSaved: (String value) {
          product['description'] = value;
        },
      ),
    );
  }

  Widget _buildPriceTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        initialValue: widget.product != null ? widget.product['price'].toString() : "",
        decoration: InputDecoration(labelText: 'Price'),
        validator: (String value) {
          //!RegExp(r'^(?:[1-9]\d*\0)?(?:\.\d+)?$').hasMatch(value)
          if (value.isEmpty) {
            return 'Price is required and should be a number';
          }
        },
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          product['price'] = double.parse(value);
        },
      ),
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

  void _saveProduct() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Fluttertoast.showToast(msg: 'field required');
    if (widget.product == null) {
      widget.addProduct(product);
    } else {
      widget.updateProduct(widget.index, product);
    }
    Navigator.pushReplacementNamed(context, ProductPage.routeName);
  }
}
