import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_detail_page.dart';
import 'package:flutter_app/widgets/products/price_tag.dart';
import 'package:flutter_app/widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products){
    print('constructor');
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
  
  Widget _buildProductList(){
    Widget productCards;
    
    if(products.length > 0){
      productCards = ListView.builder(
        itemBuilder: (context, index) => ProductCard(products[index], index),
        itemCount: products.length,
      );
    }
    else{
      productCards = Container();
    }
    return productCards;
  }
}
