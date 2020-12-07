import 'package:test/test.dart';

void main() {
  test('Read the line', () {
    var bagPattern = new RegExp("(.+) bags contain (.+)\\.");
    var partPattern = new RegExp("(\\d+?) (.+?) bags?");
    var input =
        "light red bags contain 1 bright white bag, 2 muted yellow bags.";
    Iterable<RegExpMatch> match1 = bagPattern.allMatches(input);
    Iterable<RegExpMatch> match2 = partPattern.allMatches(input);
    //print("match1 is ${match1.elementAt(0).group(1)}");

    match2.forEach((element) {
      print("${element.group(1)} ${element.group(2)}");
    });
    //print("match2 is ${match2.elementAt(0).group(1)}");
  });
}
