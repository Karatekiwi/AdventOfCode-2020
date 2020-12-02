import 'dart:io';

class AocFileReader {
  List<String> readFile(String path) {
    var file = new File(path);
    var fileContent = new List<String>();

    if (file.existsSync()) {
      List<String> lines = file.readAsLinesSync();

      for (var line in lines) {
        fileContent.add(line);
      }
    }
    return fileContent;
  }
}
