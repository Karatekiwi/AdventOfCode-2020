/**
 * Code for AoC 2020, Day 1
 */

class Day1 {
  part_1(List input) {
    for (var num1 in input) {
      for (var num2 in input) {
        int int1 = int.parse(num1);
        int int2 = int.parse(num2);

        var sum = int1 + int2;
        if (sum == 2020) {
          return int1 * int2;
        }
      }
    }
  }

  part_2(List input) {
    for (var num1 in input) {
      for (var num2 in input) {
        for (var num3 in input) {
          int int1 = int.parse(num1);
          int int2 = int.parse(num2);
          int int3 = int.parse(num3);

          var sum = int1 + int2 + int3;
          if (sum == 2020) {
            return int1 * int2 * int3;
          }
        }
      }
    }
  }
}
