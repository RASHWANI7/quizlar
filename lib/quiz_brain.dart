import 'package:quizlar/main.dart';

import 'Quastion.dart';

class Quiz_Brain {
  int _quastioncounter = 0;

  List<Quastion> _quastionbank = [
    Quastion('Some cats are actually allergic to humans', true),
    Quastion('You can lead a cow down stairs but not up stairs.', false),
    Quastion('Approximately one quarter of human bones are in the feet.', true),
    Quastion('A slug\'s blood is green.', true),
    Quastion('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Quastion('It is illegal to pee in the Ocean in Portugal.', true),
    Quastion(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Quastion(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Quastion(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Quastion(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Quastion('Google was originally called \"Backrub\".', true),
    Quastion(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Quastion(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextquastion() {
    if (_quastioncounter < _quastionbank.length - 1) {
      _quastioncounter++;
    }
  }

  String getquastiontext() {
    return quiz_brain._quastionbank[_quastioncounter].quastion_text;
  }

  bool getquastionanswer() {
    return quiz_brain._quastionbank[_quastioncounter].quastion_answer;
  }

  bool isFinished() {
    if (_quastioncounter >= _quastionbank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _quastioncounter = 0;
  }
}
