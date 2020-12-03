import 'package:AdventOfCode2020/src/day_3.dart';
import 'package:AdventOfCode2020/utils/aoc_file_reader.dart';
import 'package:test/test.dart';

void main() {
  test('Counting trees', () {
    var input = AocFileReader().readFile("assets/test/test_day_3.txt");

    final day3 = Day3();
    var result1 = day3.part_1(input);
    expect(result1, 7);

    var result2 = day3.part_2(input);
    expect(result2, 336);
  });
}
