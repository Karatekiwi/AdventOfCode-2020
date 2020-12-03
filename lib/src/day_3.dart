/**
 * Code for AoC 2020, Day 3
 */

class Day3 {
  part_1(input) {
    return countTreesInPath(input, 3, 1);
  }

  part_2(input) {
    return countTreesInPath(input, 1, 1) *
        countTreesInPath(input, 3, 1) *
        countTreesInPath(input, 5, 1) *
        countTreesInPath(input, 7, 1) *
        countTreesInPath(input, 1, 2);
  }

  int countTreesInPath(List<String> input, int right, int down) {
    var trees = 0;
    var x = right;
    var y = down;

    for (y; y < input.length; y += down) {
      var coord = input[y][x];
      if (isTree(coord)) {
        trees++;
      }

      x = (x + right) % input[y].length;
    }

    return trees;
  }

  bool isTree(element) {
    return element == "#";
  }
}
