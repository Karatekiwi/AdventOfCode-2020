import 'dart:io';

/**
 * Code for AoC 2020, Day 8
 */

class Day8 {
  List<Instruction> _instructions;
  int _accumulator;

  Day8() {
    _instructions = getBootInstructions();
  }

  part_1(input) {
    runProgram(_instructions);
    return _accumulator;
  }

  part_2(List input) {
    List<Instruction> instructions = getBootInstructions();

    for (var i = 0; i < instructions.length; i++) {
      final instruction = instructions[i];

      // try switching a command
      if (instruction.command == "jmp" || instruction.command == "nop") {
        instruction.switchCommand();
      } else {
        continue;
      }

      bool finished = runProgram(instructions);
      if (finished) {
        break;
      }

      // did not work - switch back
      if (instruction.command == "jmp" || instruction.command == "nop") {
        instruction.switchCommand();
      }
    }

    return _accumulator;
  }

  bool runProgram(List<Instruction> instructions) {
    List<Instruction> executed = new List();
    _accumulator = 0;

    for (var index = 0; index < instructions.length; index++) {
      var instruction = instructions[index];

      if (!executed.contains(instruction)) {
        executed.add(instruction);
      } else {
        return false;
      }

      switch (instruction.command) {
        case "acc":
          _accumulator += instruction.argument;
          break;
        case "jmp":
          if (instruction.argument == 0) {
            return false;
          }
          index += instruction.argument - 1;
          break;
      }
    }

    return true;
  }

  List<Instruction> getBootInstructions() {
    var file = new File("assets/day_8.txt");
    var fileContent = new List<Instruction>();

    List<String> lines = file.readAsLinesSync();

    for (var line in lines) {
      var split = line.split(" ");
      var instruction = new Instruction(split[0], int.parse(split[1]));
      fileContent.add(instruction);
    }

    return fileContent;
  }
}

class Instruction {
  String command = "";
  int argument;

  Instruction(this.command, this.argument) {}

  void switchCommand() {
    if (command == "nop") {
      command = "jmp";
    } else if (command == "jmp") {
      command = "nop";
    }
  }

  @override
  String toString() {
    return "Instruction:command:${command}, argument:${argument}]";
  }
}
