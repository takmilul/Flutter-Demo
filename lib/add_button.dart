import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function _buttonPressed;

  AddButton(this._buttonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: RaisedButton(
        child: Text('Add'),
        onPressed: () => _buttonPressed({'title':'Chocolate', 'imageUrl':'assets/food.jpg'}),
      ),
    );
  }
}
