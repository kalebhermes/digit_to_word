import 'package:test/test.dart';

import 'package:digit_to_word/digit_to_word.dart';

void main() {
  group('digit to word converts', () {
    test('single digit', () {
      expect(DigitToWord.translate(1).split(' '), hasLength(1));
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
  });
}
