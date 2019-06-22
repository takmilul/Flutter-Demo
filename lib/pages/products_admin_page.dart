import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/pages/product_edit_page.dart';
import 'package:flutter_app/pages/product_list_page.dart';
import 'package:flutter_app/pages/product_page.dart';

class ProductsAdminPage extends StatelessWidget {
  static const routeName = '/ProductsAdminPage';
  final List<Product> products;
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;

  ProductsAdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(context),
        appBar: _buildAppBar(),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct, deleteProduct: deleteProduct),
            ProductListPage(products, updateProduct, deleteProduct),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDrawer(BuildContext context){
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text("Add Product"),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('View Products'),
            onTap: () => Navigator.pushReplacementNamed(
              context,
              ProductPage.routeName,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAppBar(){
    return AppBar(
      title: Text('Manage Product'),
      bottom: TabBar(
        tabs: <Widget>[
          Tab(
            child: Text('Create Product'),
            icon: Icon(Icons.create),
          ),
          Tab(
            child: Text('My Products'),
            icon: Icon(Icons.list),
          ),
        ],
      ),
    );
  }
  
}
