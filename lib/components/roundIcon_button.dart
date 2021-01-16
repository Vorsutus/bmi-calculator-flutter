import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  //constructor init so we can pass this property
  //icon and pressed functionality are required for buttons
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 15.0,
      //disabledElevation: 6.0,
      //without onPressed the button is in the disabled state
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon), //passed in when the RoundIconButton is initialized
    );
  }
}
