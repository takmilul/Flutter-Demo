import 'package:flutter/material.dart';
import 'product_edit_page.dart';

class ProductListPage extends StatelessWidget {
  static const routeName = '/ProductListPage';
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index]['title']),
          //leading: Image.asset(products[index]['image']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductEditPage(product: products[index], index: index, updateProduct: updateProduct,);
                  },
                ),
              );
            },
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
