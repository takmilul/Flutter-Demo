import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_create_page.dart';
import 'package:flutter_app/pages/product_list_page.dart';
import 'package:flutter_app/pages/product_page.dart';

import 'auth_page.dart';

class ProductsAdminPage extends StatelessWidget {
  static const routeName = '/ProductsAdminPage';
  final Function addProduct;
  final Function deleteProduct;

  ProductsAdminPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(context),
        appBar: _buildAppBar(),
        body: TabBarView(
          children: <Widget>[
            ProductCreatePage(addProduct, deleteProduct),
            ProductListPage(),
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
