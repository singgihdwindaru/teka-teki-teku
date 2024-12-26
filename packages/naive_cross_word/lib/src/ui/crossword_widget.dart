import 'package:flutter/material.dart';
import 'package:naive_cross_word/naive_cross_word.dart';

class CrosswordWidget extends StatefulWidget {
  const CrosswordWidget({
    required this.crossWordModel,
    super.key,
  });
  final CrossWordModel crossWordModel;

  @override
  State<CrosswordWidget> createState() => _CrosswordWidgetState();
}

class _CrosswordWidgetState extends State<CrosswordWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, rowIndex) {
        return SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, colIndex) {
              return Container(
                alignment: Alignment.centerLeft,
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: widget.crossWordModel.layout.table[rowIndex][colIndex] == '-'
                      ? Colors.black
                      : widget.crossWordModel.isInRangeOfSelectedRow(
                          widget.crossWordModel.selectedCell,
                          colIndex,
                          rowIndex,
                        )
                          ? Colors.yellow.withOpacity(
                              widget.crossWordModel.isCurrentCellSelected(
                                dummyCrossWordModel.selectedCell,
                                colIndex,
                                rowIndex,
                              )
                                  ? 1.0
                                  : 0.2,
                            )
                          : Colors.white,
                  border: Border.all(
                    color: widget.crossWordModel.layout.table[rowIndex][colIndex] == '-'
                        ? widget.crossWordModel.selectedCell?.row == rowIndex && widget.crossWordModel.selectedCell?.col == colIndex
                            ? Colors.red
                            : Colors.white
                        : Colors.black,
                  ),
                ),
                child: Center(child: Text(widget.crossWordModel.layout.table[rowIndex][colIndex])),
              );
            },
            itemCount: widget.crossWordModel.layout.rows,
          ),
        );
      },
      itemCount: widget.crossWordModel.layout.cols,
    );
  }
}
