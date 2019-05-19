import 'package:flutter/material.dart';
import 'package:flutter_app/add_button.dart';
import 'package:flutter_app/products.dart';

class ProductManager extends StatelessWidget {
  /*final Function _addProduct;
  final Function _deleteProduct;*/
  final List<Map<String, dynamic>> products;
  
  ProductManager(this.products);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        /*Container(
          child: AddButton(_addProduct),
        ),*/
        Expanded(
          child: Products(products),
        )
      ],
    );
  }
}
