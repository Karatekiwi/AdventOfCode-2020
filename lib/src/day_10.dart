import 'package:AdventOfCode2020/utils/aoc_file_reader.dart';

/**
 * Code for AoC 2020, Day 10
 */

class Day10 {
  List<int> adapters;
  var difference1 = 0;
  var difference2 = 0;
  var difference3 = 0;
  var arrgangementCount = 0;
  var max = 0;

  Day10() {
    adapters = AocFileReader().readFileInts("assets/day_10.txt");
    adapters.add(0);
    adapters.sort((a, b) => a.compareTo(b));
    max = adapters.last + 3;
    adapters.add(max);
  }

  part_1(List input) {
    for (int number in adapters) {
      checkJolts(number);
    }

    return difference1 * difference3;
  }

  void checkJolts(int number) {
    if (adapters.contains(number + 1)) {
      difference1++;
    } else if (adapters.contains(number + 2)) {
      difference2++;
    } else if (adapters.contains(number + 3)) {
      difference3++;
    }
  }

  part_2(List input) {
    return countPossibilities(0);
  }

  // yeah... that takes 1h 30 to finish... not proud of this :-)
  int countPossibilities(int node) {
    if (node == max) {
      // we are at the leaf - count the path
      return 1;
    }

    if (!adapters.contains(node)) {
      // no further path
      return 0;
    }

    // try all possible nodes
    return countPossibilities(node + 1) +
        countPossibilities(node + 2) +
        countPossibilities(node + 3);
  }
}
