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
    final isOutOfBounds = number.abs() > 9223372036854775807 ? true : false;
    if (isOutOfBounds) {
      return 'Number has to be between -9223372036854775807 and 9223372036854775807';
    }
    if (number == 0) {
      return 'zero';
    } else {
      final isNegative = number > 0 ? false : true;
      if (isNegative) number = number.abs();
      var returnValue = isNegative ? 'negative ' : '';

      final paddedNumber = _padNumber(number);
      final quintillions = paddedNumber.substring(0, 1);
      final quadrillions = paddedNumber.substring(1, 4);
      final trillions = paddedNumber.substring(4, 7);
      final billions = paddedNumber.substring(7, 10);
      final millions = paddedNumber.substring(10, 13);
      final thousands = paddedNumber.substring(13, 16);
      final hundreds = paddedNumber.substring(16);

      returnValue += _translateOnesPlace(quintillions);
      returnValue = _translateOnesPlace(quintillions) != ''
          ? returnValue + ' quintillion '
          : returnValue + '';

      returnValue += _translateThreeNumbers(quadrillions);
      returnValue = _translateThreeNumbers(quadrillions) != ''
          ? returnValue + ' quadrillion '
          : returnValue + '';

      returnValue += _translateThreeNumbers(trillions);
      returnValue = _translateThreeNumbers(trillions) != ''
          ? returnValue + ' trillion '
          : returnValue + '';

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
    final numberFormat = NumberFormat('0000000000000000000');
    return numberFormat.format(originalNumber);
  }

  static String _translateThreeNumbers(String number) {
    var returnValue = '';
    final numbers = number.split('');
    final parsedNumber = int.parse(number);
    if (parsedNumber == 0) {
      return '';
    }
    returnValue += _translateHundredsPlace(numbers[0]);
    returnValue += _translateTensPlace(numbers[1], numbers[2]);

    return returnValue;
  }

  static String _translateHundredsPlace(String number) {
    final parsedNumber = int.parse(number);
    var returnValue = _singleDigit[parsedNumber];
    if (returnValue != '') {
      returnValue += ' hundred ';
    }
    return returnValue;
  }

  static String _translateTensPlace(String tens, String ones) {
    var returnValue = '';
    final parsedTens = int.parse(tens);
    final parsedOnes = int.parse(ones);
    if (parsedTens > 1) {
      returnValue += _doubleDigit[parsedTens];
      returnValue += _useDash ? '-' : ' ';
      returnValue += _singleDigit[parsedOnes];
    } else {
      returnValue += _singleDigit[(parsedTens * 10) + parsedOnes];
    }

    return returnValue;
  }

  static String _translateOnesPlace(String ones) {
    final parsedOnes = int.parse(ones);
    return _singleDigit[parsedOnes];
  }
}
