library digit_to_word;

import 'package:intl/intl.dart';

const _singleDigit = [
  '',
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine',
  'ten',
  'eleven',
  'twelve',
  'thirteen',
  'fourteen',
  'fifteen',
  'sixteen',
  'seventeen',
  'eighteen',
  'nineteen'
];
const _doubleDigit = [
  '',
  '',
  'twenty',
  'thirty',
  'forty',
  'fifty',
  'sixty',
  'seventy',
  'eighty',
  'ninty'
];
bool _useDash = true;

class DigitToWord {
  /// Translates an integer that's less than 1 trillion to a String representation of that integer.
  /// [number] needs to be less than 999999999999 or you'll recieve an error.
  /// [withDashes] is an optional boolen parameter that will prevent `-` being added between the tens and ones places.
  static String translate(int number, {bool withDashes = true}) {
    if (withDashes == false) _useDash = false;
    var isTooLong = number > 999999999999 ? true : false;
    if (isTooLong) {
      return 'Number has to be smaller than 999999999999';
    }
    if (number == 0) {
      return 'Zero';
    } else {
      String returnValue = '';
      String paddedNumber = _padNumber(number);
      var billions = paddedNumber.substring(0, 3);
      var millions = paddedNumber.substring(3, 6);
      var thousands = paddedNumber.substring(6, 9);
      var hundreds = paddedNumber.substring(9);
      returnValue += _translateThreeNumbers(billions);
      returnValue = _translateThreeNumbers(billions) != ''
          ? returnValue + ' billion '
          : returnValue + '';
      returnValue += _translateThreeNumbers(millions);
      returnValue = _translateThreeNumbers(millions) != ''
          ? returnValue + ' million '
          : returnValue + '';
      returnValue += _translateThreeNumbers(thousands);
      returnValue = _translateThreeNumbers(thousands) != ''
          ? returnValue + ' thousand '
          : returnValue + '';
      returnValue += _translateThreeNumbers(hundreds);
      return returnValue;
    }
  }

  static String _padNumber(int originalNumber) {
    NumberFormat numberFormat = NumberFormat("000000000000");
    return numberFormat.format(originalNumber);
  }

  static String _translateThreeNumbers(String number) {
    String returnValue = '';
    List<String> numbers = number.split('');
    int parsedNumber = int.parse(number);
    if (parsedNumber == 0) {
      return '';
    }
    returnValue += _translateHundredsPlace(numbers[0]);
    returnValue += _translateTensPlace(numbers[1], numbers[2]);

    return returnValue;
  }

  static String _translateHundredsPlace(String number) {
    int parsedNumber = int.parse(number);
    String returnValue = _singleDigit[parsedNumber];
    if (returnValue != '') {
      returnValue += ' hundred ';
    }
    return returnValue;
  }

  static String _translateTensPlace(String tens, String ones) {
    String returnValue = '';
    int parsedTens = int.parse(tens);
    int parsedOnes = int.parse(ones);
    if (parsedTens > 1) {
      returnValue += _doubleDigit[parsedTens];
      returnValue += _useDash ? '-' : ' ';
      returnValue += _singleDigit[parsedOnes];
    } else {
      returnValue += _singleDigit[(parsedTens * 10) + parsedOnes];
    }

    return returnValue;
  }
}
