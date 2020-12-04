import 'dart:io';

/**
 * Code for AoC 2020, Day 3
 */

class Day4 {
  part_1(input) {
    List<Passport> passports = readPassportData();
    int validPassports =
        passports.where((passport) => checkPassport(passport)).length;
    return validPassports;
  }

  part_2(input) {
    List<Passport> passports = readPassportData();
    int validPassports =
        passports.where((passport) => checkPassportExtensive(passport)).length;
    return validPassports;
  }

  bool checkPassport(Passport passport) {
    if (passport.birthYear == 0 ||
        passport.issueYear == 0 ||
        passport.expirationYear == 0) {
      return false;
    }

    if (passport.height == null ||
        passport.hairColor == null ||
        passport.eyeColor == null ||
        passport.passportId == null) {
      return false;
    }

    return true;
  }

  bool checkPassportExtensive(Passport passport) {
    if (passport.birthYear < 1920 || passport.birthYear > 2002) {
      return false;
    }
    if (passport.issueYear < 2010 || passport.issueYear > 2020) {
      return false;
    }
    if (passport.expirationYear < 2020 || passport.expirationYear > 2030) {
      return false;
    }

    bool isHeightValid = checkHeight(passport.height);
    if (!isHeightValid) {
      return false;
    }

    bool isHairColorValid = checkHairColor(passport.hairColor);
    if (!isHairColorValid) {
      return false;
    }

    bool isEyeColorValid = checkEyeColor(passport.eyeColor);
    if (!isEyeColorValid) {
      return false;
    }

    bool isIdValid = checkId(passport.passportId);
    if (!isIdValid) {
      return false;
    }

    return true;
  }

  readPassportData() {
    var file = new File("assets/day_4.txt");
    var fileContent = new List<Passport>();

    List<String> lines = file.readAsLinesSync();
    var passport = new Passport();

    for (var line in lines) {
      if (line.isEmpty) {
        fileContent.add(passport);
        passport = new Passport();
        continue;
      }
      fillPassportData(line, passport);
    }

    return fileContent;
  }

  void fillPassportData(String line, passport) {
    line.split(" ").forEach((element) {
      var key = element.split(":")[0];
      var value = element.split(":")[1];
      switch (key) {
        case "byr":
          passport.birthYear = int.parse(value);
          break;
        case "iyr":
          passport.issueYear = int.parse(value);
          break;
        case "eyr":
          passport.expirationYear = int.parse(value);
          break;
        case "hgt":
          passport.height = value;
          break;
        case "hcl":
          passport.hairColor = value;
          break;
        case "ecl":
          passport.eyeColor = value;
          break;
        case "pid":
          passport.passportId = value;
          break;
        case "cid":
          passport.countryId = value;
          break;
      }
    });
  }

  bool checkHeight(String height) {
    if (height == null || !(height.contains("cm") || height.contains("in"))) {
      return false;
    }

    if (height.contains("cm")) {
      int heightValue = int.parse(height.replaceAll("cm", ""));
      if (heightValue < 150 || heightValue > 193) {
        return false;
      }
    } else if (height.contains("in")) {
      int heightValue = int.parse(height.replaceAll("in", ""));
      if (heightValue < 59 || heightValue > 76) {
        return false;
      }
    }
    return true;
  }

  bool checkHairColor(String hairColor) {
    if (hairColor == null) {
      return false;
    }
    var regex = RegExp(r'#[0-9a-f]{6}');
    if (!hairColor.contains(regex)) {
      return false;
    }

    return true;
  }

  bool checkEyeColor(String eyeColor) {
    if (eyeColor == null) {
      return false;
    }
    var regex = RegExp(r'amb|blu|brn|gry|grn|hzl|oth');
    if (!eyeColor.contains(regex)) {
      return false;
    }

    return true;
  }

  bool checkId(String passportId) {
    if (passportId == null) {
      return false;
    }
    if (passportId.length != 9) {
      return false;
    }

    return true;
  }
}

class Passport {
  int birthYear = 0;
  int issueYear = 0;
  int expirationYear = 0;
  String height;
  String hairColor;
  String eyeColor;
  String passportId;
  String countryId;

  @override
  String toString() =>
      "Passport:birthYear:${birthYear}, issueYear:${issueYear}, expirationYear:${expirationYear}, height:${height}, hairColor:${hairColor}, eyeColor:${eyeColor}, passportId:${passportId}, countryId:${countryId}";
}
