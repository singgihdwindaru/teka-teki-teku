import 'package:flutter/material.dart';
import 'package:naive_cross_word/naive_cross_word.dart';

class CrosswordWidget extends StatefulWidget {
  const CrosswordWidget({super.key});

  @override
  State<CrosswordWidget> createState() => _CrosswordWidgetState();
}

class _CrosswordWidgetState extends State<CrosswordWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, colIndex) {
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, rowIndex) {
            if (dummyCrossWordModel.layout.table[rowIndex][colIndex] != '-') {
              return Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                ),
              );
            } else {
              return const ColoredBox(
                color: Colors.black,
                child: SizedBox(
                  width: 30,
                  height: 30,
                ),
              );
            }
          },
          separatorBuilder: (context, rowIndex) {
            return const Divider();
          },
          itemCount: dummyCrossWordModel.layout.rows,
        );
      },
      separatorBuilder: (context, colIndex) {
        return const Divider();
      },
      itemCount: dummyCrossWordModel.layout.cols,
    );
  }
}
