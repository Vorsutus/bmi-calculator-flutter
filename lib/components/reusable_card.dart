import 'package:flutter/material.dart';

//the reusable card needs to be a stateful widget so we can changes the background of the card
class ReusableCard extends StatelessWidget {
  //used for custom values for cards
//  const ReusableCard({
//    Key key,
//  }) : super(key: key);

  //"final must be put in front to make the property immutable (can't be changed)"
  final Color
      colour; //no init value (we will pass a value when we create a new card using the widget)
  final Widget cardChild;
  final Function onPressed; //function name variable that we will pass in

  //creating a constructor (adding {} to used the name of the property)
  //@required makes sure a property gets passed when widget is created
  //second property is optional because not all card widgets will need children
  //the third property is a function that is passed in from ReusableCard > onPressed: > stuff to do = onTap: onPressed function
  ReusableCard({@required this.colour, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child:
            cardChild, //this is where the cardChild will go within the widget
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          //color: Color(0xFF1D1E33),
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
