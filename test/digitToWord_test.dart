import 'package:test/test.dart';

import 'package:digit_to_word/digit_to_word.dart';

void main() {
  group('digit to word converts', () {
    test('zero', () {
      expect(DigitToWord.translate(0), 'zero');
    });
    test('single digit', () {
      expect(DigitToWord.translate(1).split(' '), hasLength(1));
    });

    test('negative single digit', () {
      expect(DigitToWord.translate(-1).split(' '), hasLength(2));
    });

    test('double digit', () {
      expect(DigitToWord.translate(67).split(' '), hasLength(1));
    });

    test('triple digit', () {
      expect(DigitToWord.translate(513).split(' '), hasLength(3));
    });

    test('four digit', () {
      expect(DigitToWord.translate(6398).split(' '), hasLength(5));
    });

    test('five digit', () {
      expect(DigitToWord.translate(23574).split(' '), hasLength(5));
    });

    test('six digit', () {
      expect(DigitToWord.translate(691025).split(' '), hasLength(5));
    });

    test('seven digit', () {
      expect(DigitToWord.translate(1586124).split(' '), hasLength(9));
    });

    test('eight digit', () {
      expect(DigitToWord.translate(96685361).split(' '), hasLength(9));
    });

    test('nine digit', () {
      expect(DigitToWord.translate(165971036).split(' '), hasLength(9));
    });

    test('ten digit', () {
      expect(DigitToWord.translate(1597803654).split(' '), hasLength(13));
    });

    test('eleven digit', () {
      expect(DigitToWord.translate(39870510978).split(' '), hasLength(13));
    });

    test('twelve digit', () {
      expect(DigitToWord.translate(987326580120).split(' '), hasLength(15));
    });

    test('fifteen digit', () {
      expect(DigitToWord.translate(987326580120487).split(' '), hasLength(19));
    });

    test('eighteen digit', () {
      expect(
          DigitToWord.translate(987326580120487429).split(' '), hasLength(23));
    });

    test('ningteen digit', () {
      expect(
          DigitToWord.translate(5213342525854785897).split(' '), hasLength(25));
    });

    test('biggest number', () {
      expect(DigitToWord.translate(9223372036854775807),
          'nine quintillion two hundred twenty-three quadrillion three hundred seventy-two trillion thirty-six billion eight hundred fifty-four million seven hundred seventy-five thousand eight hundred seven');
    });

    test('negative', () {
      expect(DigitToWord.translate(-5213342525854785897), contains('negative'));

      expect(DigitToWord.translate(5213342525854785897),
          isNot(contains('negative')));
    });
  });
}
