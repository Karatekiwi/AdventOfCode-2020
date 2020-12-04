import 'package:AdventOfCode2020/src/day_4.dart';
import 'package:AdventOfCode2020/utils/aoc_file_reader.dart';
import 'package:test/test.dart';

void main() {
  test('Counting trees', () {
    var input = AocFileReader().readFile("assets/test/test_day_4.txt");

    final day = Day4();
    var result1 = day.part_1(input);
    expect(result1, 2);
  });
}
