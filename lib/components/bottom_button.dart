import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
//  const BottomButton({
//    Key key,
//  }) : super(key: key);

//CUSTOM constructor for button with required
  BottomButton({@required this.onTap, @required this.buttonTitle});

//properties for CUSTOM onTap and text
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //we need a CUSTOM onTap because function will differ from button to button
      onTap: onTap,
      child: Container(
        child: Center(
          //we need a CUSTOM text because it will differ from button to button
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 15),
        width: double.infinity, //full width of the screen
        height: kBottomContainerHeight,
      ),
    );
  }
}
