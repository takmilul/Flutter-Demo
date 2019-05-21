import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget{
    final String address;
    
    AddressTag(this.address);
    
    @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 0.5, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(address),
    );
  }
}