/// CrossWordModel
class CrossWordModel {
  /// CrossWordModel
  CrossWordModel({
    required this.id,
    required this.title,
    required this.layout,
    required this.words,
  });

  /// The unique identifier of the crossword.
  final String id;

  /// The title of the crossword.
  final String title;

  /// The list of words in the crossword.
  final List<WordModel> words;

  /// The layout of the crossword.
  CrossWordLayout layout;
}

/// WordModel
class WordModel {
  /// WordModel
  WordModel({
    required this.id,
    required this.title,
    required this.answer,
    required this.position,
    required this.startRow,
    required this.startCol,
    required this.endRow,
    required this.endCol,
    required this.orientation,
  });

  /// The unique identifier of the word.
  final String id;

  /// The title of the word.
  final String title;

  /// The answer of the word.
  final String answer;

  /// The position of the word.
  final int position;

  /// The starting row of the word.
  final int startRow;

  /// The starting column of the word.
  final int startCol;

  /// The end row of the word.
  final int endRow;

  /// The end column of the word.
  final int endCol;

  /// The orientation of the word.
  final String orientation;
}

/// CrossWordLayout
class CrossWordLayout {
  /// CrossWordLayout
  CrossWordLayout({
    required this.rows,
    required this.cols,
    required this.table,
  });

  /// The number of rows in the crossword.
  int rows;

  /// The number of columns in the crossword.
  int cols;

  /// The table of the crossword.
  List<List<String>> table;
}
