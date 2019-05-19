import 'package:flutter/material.dart';
import 'package:flutter_app/product_manager.dart';
import 'products_admin_page.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/ProductPage';
  /*final Function _addProduct;
  final Function _deleteProduct;*/
  final List<Map<String, dynamic>> products;

  ProductPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Manage Product'),
              onTap: () => Navigator.pushReplacementNamed(
                    context,
                    ProductsAdminPage.routeName,
                  ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite), onPressed: (){},)
        ],
      ),
      body: ProductManager(products),
    );
  }
}
