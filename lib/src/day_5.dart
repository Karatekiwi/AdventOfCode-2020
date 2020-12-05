import 'dart:math' as math;

import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:quiver/iterables.dart';

/**
 * Code for AoC 2020, Day 5
 */

class Day5 {
  part_1(input) {
    var usedSeatIds = new List<int>();
    input.forEach((element) => {usedSeatIds.add(calculateSeatId(element))});
    return usedSeatIds.reduce(math.max);
  }

  part_2(List input) {
    var usedSeatIds = new List<int>();
    input.forEach((element) => {usedSeatIds.add(calculateSeatId(element))});

    List<num> notUsedSeatIds =
        range(1023).where((seat) => !usedSeatIds.contains(seat)).toList();

    int mySeat = notUsedSeatIds.firstWhere((id) =>
        !(notUsedSeatIds.contains(id + 1) || notUsedSeatIds.contains(id - 1)));
    return mySeat;
  }

  Pair<int, int> calculateRange(Pair<int, int> range, bool upper) {
    if (upper) {
      int newFirst = range.last - ((range.last - range.first) / 2).floor();
      return Pair(newFirst, range.last);
    }

    int newLast = range.last - ((range.last - range.first) / 2).ceil();
    return Pair(range.first, newLast);
  }

  int calculateSeatId(line) {
    var rowRange = Pair(0, 127);
    var columnRange = Pair(0, 7);
    int row = 0;
    int column = 0;

    line.split('').forEach((element) {
      if (element == "F") {
        rowRange = calculateRange(rowRange, false);
      } else if (element == "B") {
        rowRange = calculateRange(rowRange, true);
      } else if (element == "L") {
        columnRange = calculateRange(columnRange, false);
      } else if (element == "R") {
        columnRange = calculateRange(columnRange, true);
      }

      if (rowRange.first == rowRange.last) {
        row = rowRange.first;
      }

      if (columnRange.first == columnRange.last) {
        column = columnRange.first;
      }
    });

    return row * 8 + column;
  }
}
