/**
 * Code for AoC 2020, Day 3
 */

class Day2 {
  part_1(input) {
    var numCorrectWords = 0;

    for (var line in input) {
      PasswordCheck check = createFromInput(line);

      // check password
      var matches = new RegExp(check.letter).allMatches(check.password).length;
      if (matches >= check.num1 && matches <= check.num2) {
        numCorrectWords++;
      }
    }

    return numCorrectWords;
  }

  part_2(input) {
    var numCorrectWords = 0;

    for (var line in input) {
      PasswordCheck check = createFromInput(line);

      // check password
      var atPosition1 = check.password[check.num1 - 1] == check.letter;
      var atPosition2 = check.password[check.num2 - 1] == check.letter;

      if ((atPosition1 && !atPosition2) || (!atPosition1 && atPosition2)) {
        numCorrectWords++;
      }
    }

    return numCorrectWords;
  }

  PasswordCheck createFromInput(line) {
    var split = line.split(" ");
    var occurrences = split[0];
    var num1 = int.parse(occurrences.split("-")[0]);
    var num2 = int.parse(occurrences.split("-")[1]);
    var letter = split[1].replaceAll(":", "");
    var password = split[2];
    return PasswordCheck(password, letter, num1, num2);
  }
}

class PasswordCheck {
  String password;
  String letter;
  int num1;
  int num2;

  PasswordCheck(this.password, this.letter, this.num1, this.num2);
}
