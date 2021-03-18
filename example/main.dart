library digit_to_word.example;

import 'package:digit_to_word/digit_to_word.dart';

void main() {
  // Prints the String 'one';
  print(DigitToWord.translate(1));

  // Prints the String 'one thousand two hundred thirty-four'
  print(DigitToWord.translate(1234));

  // Prints the String 'one thousand two hundred thirty four'
  print(DigitToWord.translate(1234, withDashes: false));
}