/**
 * Code for AoC 2020, Day 1
 */

class Day1 {
  part_1(List<int> input) {
    for (var num1 in input) {
      for (var num2 in input) {
        var sum = num1 + num2;
        if (sum == 2020) {
          return num1 * num2;
        }
      }
    }
  }

  part_2(List<int> input) {
    for (var num1 in input) {
      for (var num2 in input) {
        for (var num3 in input) {
          var sum = num1 + num2 + num3;
          if (sum == 2020) {
            return num1 * num2 * num3;
          }
        }
      }
    }
  }
}
