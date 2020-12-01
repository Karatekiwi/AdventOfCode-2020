import 'dart:mirrors';

import 'package:AdventOfCode2020/src/day_1.dart';
import 'package:AdventOfCode2020/src/day_2.dart';
import 'package:AdventOfCode2020/src/day_3.dart';
import 'package:AdventOfCode2020/utils/aoc_file_reader.dart';

class AocMain {
  List _dayClasses = new List();

  AocMain() {
    initClasses();
  }

  getSolution(int day, int part) {
    var input = AocFileReader().readFile("assets/day_$day.txt");
    var dayClass = _dayClasses[day - 1];
    var instanceMirror = reflect(dayClass);
    return instanceMirror.invoke(Symbol("part_$part"), [input]).reflectee;
  }

  void initClasses() {
    _dayClasses.add(new Day1());
    _dayClasses.add(new Day2());
    _dayClasses.add(new Day3());
  }
}
