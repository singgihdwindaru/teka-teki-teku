// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:naive_cross_word/naive_cross_word.dart';

void main() {
  group('NaiveCrossWord', () {
    test('can be instantiated', () {
      expect(NaiveCrossWord(), isNotNull);
    });

    test('getAnswerOfSelectedCell', () {
      expect(dummyCrossWordModel.getAnswerOfSelectedCell(1, 0), 'INDONESIA');
    });

    test('getWordOfSelectedCell', () {
      expect(dummyCrossWordModel.getWordOfSelectedCell(1, 0).answer, 'INDONESIA');
    });
    test('isCurrentCellSelected', () {
      expect(dummyCrossWordModel.isCurrentCellSelected(SelectedCell(0, 1), 1, 0), true);
    });
    test('isInRangeOfSelectedRow', () {
      expect(dummyCrossWordModel.isInRangeOfSelectedRow(SelectedCell(0, 1), 1, 0), true);
    });

    test('getAnswerOfSelectedCellCross', () {
      expect(dummyCrossWordModel.getAnswerOfSelectedCell(2, 3), 'OMAN');
    });

    test('getWordOfSelectedCellCross', () {
      expect(dummyCrossWordModel.getWordOfSelectedCell(2, 3).answer, 'OMAN');
    });
    test('isCurrentCellSelectedCross', () {
      expect(dummyCrossWordModel.isCurrentCellSelected(SelectedCell(3, 2), 2, 3), true);
    });
    test('isInRangeOfSelectedRowCross', () {
      expect(dummyCrossWordModel.isInRangeOfSelectedRow(SelectedCell(3, 2), 2, 3), true);
    });

    test('selectedCell', () {
      final selectedCell = SelectedCell(0, 1);
      expect(selectedCell.row, 0);
      expect(selectedCell.col, 1);
    });

    testWidgets('widget have a tiles', (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: const CrosswordWidget(),
        ),
      );
      final titleFinder = find.text('I');
      final messageFinder = find.text('N');
      expect(titleFinder, findsAtLeastNWidgets(1));
      expect(messageFinder, findsAtLeastNWidgets(1));
    });
  });
}

final CrossWordModel dummyCrossWordModel = CrossWordModel(
  id: '1',
  title: 'negara',
  layout: CrossWordLayout(
    rows: 10,
    cols: 10,
    table: [
      ['-', 'I', '-', '-', 'I', '-', '-', '-', '-', '-'],
      ['-', 'N', '-', '-', 'R', '-', '-', '-', '-', '-'],
      ['-', 'D', '-', '-', 'A', '-', '-', 'I', '-', '-'],
      ['-', 'O', 'M', 'A', 'N', '-', '-', 'R', '-', '-'],
      ['-', 'N', '-', 'R', '-', '-', '-', 'A', '-', '-'],
      ['-', 'E', '-', 'A', 'F', 'R', 'I', 'K', 'A', '-'],
      ['-', 'S', '-', 'B', '-', '-', '-', '-', '-', '-'],
      ['-', 'I', '-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', 'A', '-', '-', '-', '-', '-', '-', '-', '-'],
      ['-', '-', '-', '-', '-', '-', '-', '-', '-', '-'],
    ],
  ),
  words: [
    WordModel(
      id: 'INDONESIA',
      title: 'INDONESIA',
      answer: 'INDONESIA',
      position: 1,
      startRow: 0,
      startCol: 1,
      endRow: 9,
      endCol: 1,
      orientation: 'down',
    ),
    WordModel(
      id: 'OMAN',
      title: 'OMAN',
      answer: 'OMAN',
      position: 2,
      startRow: 3,
      startCol: 2,
      endRow: 2,
      endCol: 4,
      orientation: 'across',
    ),
    WordModel(
      id: 'ARAB',
      title: 'ARAB',
      answer: 'ARAB',
      position: 3,
      startRow: 3,
      startCol: 3,
      endRow: 6,
      endCol: 3,
      orientation: 'down',
    ),
    WordModel(
      id: 'AFRIKA',
      title: 'AFRIKA',
      answer: 'AFRIKA',
      position: 4,
      startRow: 5,
      startCol: 3,
      endRow: 5,
      endCol: 8,
      orientation: 'across',
    ),
    WordModel(
      id: 'IRAK',
      title: 'IRAK',
      answer: 'IRAK',
      position: 5,
      startRow: 2,
      startCol: 7,
      endRow: 5,
      endCol: 7,
      orientation: 'down',
    ),
  ],
);
