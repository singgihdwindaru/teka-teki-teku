// ignore_for_file: prefer_const_constructors

import 'package:cross_word/cross_word.dart';
import 'package:cross_word/src/cross_word.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CrossWord', () {
    test('can be instantiated', () {
      expect(CrossWord(), isNotNull);
    });
  });
}
