import 'dart:io';

/**
 * Code for AoC 2020, Day 7
 */

class Day7 {
  List<Bag> rules;

  Day7() {
    rules = getBagRules();
  }

  part_1(input) {
    List<String> colorsToSearch = new List();
    colorsToSearch.add("shiny gold");

    searchRecursive(colorsToSearch);

    return colorsToSearch.length - 1;
  }

  part_2(List input) {
    return findAndCountBag("shiny gold") - 1;
  }

  void searchRecursive(List<String> colorsToSearch) {
    bool added = false;

    rules.forEach((bag) {
      bag.inside.forEach((element) {
        if (colorsToSearch.contains(element.color)) {
          if (!colorsToSearch.contains(bag.color)) {
            added = true;
            colorsToSearch.add(bag.color);
          }
        }
      });
    });

    if (added) {
      searchRecursive(colorsToSearch);
    }
  }

  int findAndCountBag(String color) {
    var count = 1;
    Bag current = rules.where((bag) => bag.color == color).first;

    current.inside.forEach((element) {
      count += findAndCountBag(element.color) * element.numBags;
    });

    return count;
  }

  List<Bag> getBagRules() {
    var file = new File("assets/day_7.txt");
    var fileContent = new List<Bag>();

    List<String> lines = file.readAsLinesSync();

    for (var line in lines) {
      var bag = new Bag();
      var bagPattern = new RegExp("(.+) bags contain (.+)\\.");
      var partPattern = new RegExp("(\\d+?) (.+?) bags?");
      bag.color = bagPattern.allMatches(line).elementAt(0).group(1);

      partPattern.allMatches(line).forEach((element) {
        var insideBag = new Bag();
        insideBag.numBags = int.parse(element.group(1));
        insideBag.color = element.group(2);
        bag.inside.add(insideBag);
      });

      fileContent.add(bag);
    }
    return fileContent;
  }
}

class Bag {
  String color = "";
  int numBags = 0;
  var inside = List<Bag>();

  @override
  String toString() {
    if (inside.isEmpty) {
      return "Bag:color:${color}, numBags:${numBags}";
    }
    String insides = "";
    inside.forEach((element) {
      insides += element.toString() + ", ";
    });

    return "Bag:color:${color}, numBags:${numBags}, inside:[${insides}]";
  }
}
