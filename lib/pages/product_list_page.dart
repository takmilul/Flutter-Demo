import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import 'product_edit_page.dart';

class ProductListPage extends StatelessWidget {
  static const routeName = '/ProductListPage';
  final List<Product> products;
  final Function updateProduct;
  final Function deleteProduct;
  
  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(products[index].title),
          background: Container(color: Colors.red),
          onDismissed: (DismissDirection direction){
            if(direction == DismissDirection.endToStart){
              deleteProduct(index);
              print('swiped end to start');
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(products[index].title),
                subtitle: Text('\$${products[index].price.toString()}'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index].image),
                ),
                trailing: _buildEditIcon(context, index),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
  
  Widget _buildEditIcon(BuildContext context, int index){
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ProductEditPage(
                product: products[index],
                index: index,
                updateProduct: updateProduct,
              );
            },
          ),
        );
      },
    );
  }
}
