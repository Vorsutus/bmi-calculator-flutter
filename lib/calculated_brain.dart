import 'dart:math';

class CalculatorBrain {
  //can now supply the values of the height and weight when we create a new CalculatorBrain
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  //made private so it won't be able to be accessed from anywhere but here
  double _bmi;

  //functionality for calculating the BMI (mass kg/(height m^2))
  String calculateBMI() {
    _bmi = (weight / pow(height, 2) * 703);
    //fixed to 1 decimal points (and set as a string)
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Yor body weight is higher than what is healthy. Try to eat less carbs.';
    } else if (_bmi >= 18.5) {
      return 'You have a healthy body weight. Good Job!';
    } else {
      return 'You have a lower than healthy body weight. You should seek more nourishment';
    }
  }
}
