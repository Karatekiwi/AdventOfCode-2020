/**
 * Code for AoC 2020, Day 1
 */

class Day1 {
  part_1(List<int> input) {
    var result;

    OUTER:
    for (var a in input) {
      for (var b in input) {
        var sum = a + b;
        if (sum == 2020) {
          result = a * b;
          break OUTER;
        }
      }
    }

    return result;
  }

  part_2(input) {
    var result;

    OUTER:
    for (var a in input) {
      for (var b in input) {
        for (var c in input) {
          var sum = a + b + c;
          if (sum == 2020) {
            result = a * b * c;
            break OUTER;
          }
        }
      }
    }

    return result;
  }
}
