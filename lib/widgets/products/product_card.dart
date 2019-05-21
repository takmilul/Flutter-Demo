import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_detail_page.dart';
import 'package:flutter_app/widgets/products/price_tag.dart';
import 'package:flutter_app/widgets/ui_elements/title_default.dart';

import 'address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  ProductCard(this.product, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['imageUrl']),
          _buildTitlePriceRow(),
          AddressTag(product['address']),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product['title']),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product['price'].toString()),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
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
          onPressed: () {},
          tooltip: 'Favourite',
        ),
      ],
    );
  }
}
