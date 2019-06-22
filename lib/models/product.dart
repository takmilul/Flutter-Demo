import 'package:flutter/material.dart';

class Product {
  final String title;
  final String image;
  final String description;
  final double price;
  final String address;

  Product({
    @required this.title,
    @required this.image,
    @required this.description,
    @required this.price,
    @required this.address,
  });
}
