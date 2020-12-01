import 'dart:io';
import 'dart:convert';

class AocFileReader {
  List<int> readFile(String path) {
    var file = new File(path);
    var fileContent = new List<int>();

    if (file.existsSync()) {
      List<String> lines = file.readAsLinesSync();

      for (var line in lines) {
        fileContent.add(int.parse(line));
      }
    }
    return fileContent;
  }
}
