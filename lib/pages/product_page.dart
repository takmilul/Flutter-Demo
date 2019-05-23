import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/products/products.dart';
import 'default_page.dart';
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
      drawer: _buildDrawer(context),
      appBar: _buildAppBar(),
      body: Products(products),
    );
  }
  
  Widget _buildDrawer(BuildContext context){
    return Drawer(
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
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Design Test'),
            onTap: () => Navigator.pushNamed(context, DefaultPage.routeName),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAppBar(){
    return AppBar(
      title: Text('Home'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.favorite), onPressed: (){},)
      ],
    );
  }
  
}
