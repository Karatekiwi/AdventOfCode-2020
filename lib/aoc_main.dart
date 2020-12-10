import 'dart:io';
import 'dart:mirrors';

import 'package:AdventOfCode2020/src/day_1.dart';
import 'package:AdventOfCode2020/src/day_10.dart';
import 'package:AdventOfCode2020/src/day_2.dart';
import 'package:AdventOfCode2020/src/day_3.dart';
import 'package:AdventOfCode2020/src/day_4.dart';
import 'package:AdventOfCode2020/src/day_5.dart';
import 'package:AdventOfCode2020/src/day_6.dart';
import 'package:AdventOfCode2020/src/day_7.dart';
import 'package:AdventOfCode2020/src/day_8.dart';
import 'package:AdventOfCode2020/src/day_9.dart';
import 'package:AdventOfCode2020/utils/aoc_file_reader.dart';

class AocMain {
  List _dayClasses = new List();

  AocMain() {
    initClasses();
  }

  getSolution(int day, int part) {
    var input = AocFileReader().readFile("assets/day_$day.txt");
    try {
      var dayClass = _dayClasses[day - 1];
      var instanceMirror = reflect(dayClass);
      return instanceMirror.invoke(Symbol("part_$part"), [input]).reflectee;
    } on RangeError catch (ex) {
      print("The day is not yet implemented.");
      exit(1);
    }
  }

  void initClasses() {
    _dayClasses.add(new Day1());
    _dayClasses.add(new Day2());
    _dayClasses.add(new Day3());
    _dayClasses.add(new Day4());
    _dayClasses.add(new Day5());
    _dayClasses.add(new Day6());
    _dayClasses.add(new Day7());
    _dayClasses.add(new Day8());
    _dayClasses.add(new Day9());
    _dayClasses.add(new Day10());
  }
}
