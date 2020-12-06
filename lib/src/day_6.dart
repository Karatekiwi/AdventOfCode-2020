import 'dart:io';

/**
 * Code for AoC 2020, Day 6
 */

class Day6 {
  part_1(input) {
    var numAnswers = 0;

    readGroupAnswers().forEach((group) {
      var answerList = new List<String>();

      group.answers.forEach((answer) {
        answer.split("").forEach((letter) {
          if (!answerList.contains(letter)) {
            answerList.add(letter);
          }
        });
      });

      numAnswers += answerList.length;
    });

    return numAnswers;
  }

  part_2(List input) {
    var numAnswers = 0;

    readGroupAnswers().forEach((group) {
      int peopleInGroup = group.answers.length;

      var answerList = new List<String>();
      group.answers.forEach((answer) {
        answer.split("").forEach((letter) {
          answerList.add(letter);
        });
      });

      var map = Map();
      answerList
          .forEach((x) => map[x] = !map.containsKey(x) ? (1) : (map[x] + 1));
      map.removeWhere((key, value) => value != peopleInGroup);
      numAnswers += map.length;
    });

    return numAnswers;
  }

  List<Group> readGroupAnswers() {
    var file = new File("assets/day_6.txt");
    var fileContent = new List<Group>();

    List<String> lines = file.readAsLinesSync();
    var group = new Group();

    for (var line in lines) {
      if (line.isEmpty) {
        fileContent.add(group);
        group = new Group();
        continue;
      }
      getGroupAnswers(line, group);
    }

    return fileContent;
  }

  void getGroupAnswers(String line, Group group) {
    group.answers.add(line);
  }
}

class Group {
  List<String> answers = new List();

  @override
  String toString() => "Group:answers:${answers.toString()}";
}
