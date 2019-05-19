import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_detail_page.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _productItem,
      itemCount: products.length,
    );
  }

  Widget _productItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['imageUrl']),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Text(
                    '\$${products[index]['price'].toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text('Mirpur, Dhaka, Bangladesh'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Theme.of(context).accentColor,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(4.0)),
                child:*/
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => Navigator.pushNamed<bool>(
                      context,
                      ProductDetail.routeName + index.toString(),
                    ) /*.then((bool onValue) {
                      if(onValue) {
                        deleteProduct(index);
                      }
                    })*/
                ,
                tooltip: 'Detail',
                //child: Text("Next Page"),
              ),
              /*),*/
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: (){},
                tooltip: 'Favourite',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
