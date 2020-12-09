import 'dart:math';

import 'package:trotter/trotter.dart';

/**
 * Code for AoC 2020, Day 9
 */

class Day9 {
  var preambleSize = 25;

  Day9() {}

  part_1(input) {
    var preambleList = input.sublist(0, preambleSize);
    var toCheck = input.sublist(preambleSize, input.length);

    return checkNumbers(preambleList, toCheck);
  }

  part_2(List input) {
    //var expected = 127;
    var expected = part_1(input);
    var sum = 0;
    var start = 0;

    List<int> together = new List();
    for (int index = 0; index < input.length; index++) {
      int current = input[index];
      together.add(current);
      sum += current;
      if (sum == expected) {
        //print("together $together");
        break;
      }
      if (sum > expected) {
        together = new List();
        sum = 0;
        start++;
        index = start;
      }
    }

    return together.reduce(max) + together.reduce(min);
  }

  int checkNumbers(List<int> preambleList, List<int> toCheck) {
    for (int element in toCheck) {
      //print("Checking number $element");
      bool validNumber = checkNumber(element, preambleList);
      if (!validNumber) {
        print(element);
        return element;
      }

      if (preambleList.length >= preambleSize) {
        preambleList = preambleList.sublist(1, preambleList.length);
      }
      preambleList.add(element);
    }

    return 0;
  }

  bool checkNumber(int number, List<int> preambleList) {
    var combos = Combinations(2, preambleList);
    for (final combo in combos()) {
      if (combo.first != combo.last && combo.first + combo.last == number) {
        return true;
      }
    }

    print("No valid combo for number $number in $preambleList");
    return false;
  }
}
