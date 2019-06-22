import 'package:flutter/material.dart';
import 'package:flutter_app/pages/auth_page.dart';
import 'package:flutter_app/pages/default_page.dart';
import 'package:flutter_app/pages/product_page.dart';
import 'package:flutter_app/pages/products_admin_page.dart';
import 'package:flutter_app/pages/product_edit_page.dart';
import 'package:flutter_app/pages/product_list_page.dart';
import 'package:flutter_app/pages/product_detail_page.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/models/product.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
//  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Product> _products = [];

  @override
  void initState() {
    //_products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _updateProduct(int index, Product product){
    setState(() {
      _products[index] = product;
    });
  }
  
  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Flutter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.cyan,
      ),
      initialRoute: '/',
      routes: {
        DefaultPage.routeName: (context) => DefaultPage(),
        AuthPage.routeName: (context) => AuthPage(_addProduct, _deleteProduct),
        ProductPage.routeName: (context) => ProductPage(_products),
        ProductsAdminPage.routeName: (context) => ProductsAdminPage(_addProduct, _updateProduct, _deleteProduct, _products),
        ProductEditPage.routeName: (context) => ProductEditPage(addProduct: _addProduct, deleteProduct: _deleteProduct),
        ProductListPage.routeName: (context) => ProductListPage(_products, _updateProduct, _deleteProduct),
        //ProductDetail.routeName: (context) => ProductDetail()
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> elements = settings.name.split('/');

        if (elements[0] != '') {
          return null;
        }
        if (elements[1] == 'ProductDetailPage') {
          int index = int.parse(elements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductDetail(_products[index].title, _products[index].image, _products[index].address),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        print('Wrong route');
        return null;
      },
    );
  }
}
