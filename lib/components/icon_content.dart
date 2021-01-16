import 'package:flutter/material.dart';
import '../constants.dart';

class CardColumn extends StatelessWidget {
//  const cardColumn({
//    Key key,
//  }) : super(key: key);

  CardColumn({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon, //custom value
          size: 80.0,
        ),
        //SizedBox used to add a little gap between icon and text
        SizedBox(
          height: 15.0,
        ),
        Text(
          label, //custom value
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
