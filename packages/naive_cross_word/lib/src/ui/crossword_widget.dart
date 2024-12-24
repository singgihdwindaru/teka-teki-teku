import 'package:flutter/material.dart';
import 'package:naive_cross_word/naive_cross_word.dart';

class CrosswordWidget extends StatefulWidget {
  const CrosswordWidget({super.key});

  @override
  State<CrosswordWidget> createState() => _CrosswordWidgetState();
}

class _CrosswordWidgetState extends State<CrosswordWidget> {
  SelectedCell? selectedCell;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, rowIndex) {
        return SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, colIndex) {
              return Container(
                alignment: Alignment.centerLeft,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: dummyCrossWordModel.layout.table[rowIndex][colIndex] == "-"
                      ? Colors.black
                      : dummyCrossWordModel.isInRangeOfSelectedRow(selectedCell, colIndex, rowIndex)
                          ? Colors.yellow.withOpacity(dummyCrossWordModel.isCurrentCellSelected(selectedCell, colIndex, rowIndex) ? 1.0 : 0.2)
                          : Colors.white,
                  border: Border.all(
                    color: dummyCrossWordModel.layout.table[rowIndex][colIndex] == "-"
                        ? selectedCell?.row == rowIndex && selectedCell?.col == colIndex
                            ? Colors.red
                            : Colors.white
                        : Colors.black,
                  ),
                ),
                child: Center(child: Text("${dummyCrossWordModel.layout.table[rowIndex][colIndex]}")),
              );
            },
            itemCount: dummyCrossWordModel.layout.rows,
          ),
        );
      },
      itemCount: dummyCrossWordModel.layout.cols,
    );
  }
}
