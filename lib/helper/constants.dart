class Constants {
  Constants();
  static final RegExp _checkHouseholdID = RegExp(
    r'^([a-zA-Z]\d{2}|\d[a-zA-Z]\d{2}|\d{2}[a-zA-Z]\d|\d{3}[a-zA-Z])$',
  );

  createHouseholdID(String lastAvailableID) {
    if (lastAvailableID != null) {
      String serialID;
      String rollNumber;
      if (isValidHouseholdID(lastAvailableID)) {
        serialID = lastAvailableID.substring(0, 1);
        rollNumber = lastAvailableID.substring(1, 3);
        //print(serialID);
        return incrementHouseholdID(serialID, rollNumber);
      }
    }
  }

  isValidHouseholdID(String hhid) {
    return _checkHouseholdID.hasMatch(hhid);
  }

  incrementHouseholdID(String serial, String id) {
    String currentSerial = serial;
    String sRollNumber = id;
    int rollNumber = int.parse(id);
    if (rollNumber == 99 && (currentSerial.codeUnitAt(0) != 90)) {
      rollNumber = 0;
      currentSerial = increment(serial);
    } else if (rollNumber == 99 && (currentSerial.codeUnitAt(0) == 90)){
      //print("Cant Proceed further");
      return null;
    }
      else{
      rollNumber++;
    }
    if (rollNumber >= 0 && rollNumber < 10) {
      sRollNumber = "0" + rollNumber.toString();
    }else{
      sRollNumber = rollNumber.toString();
    }
    //print(currentSerial + sRollNumber);
    return currentSerial + sRollNumber;
  }

  increment(final String source) {
    int char_a = source.codeUnitAt(0);
    String nextSerial =
        new String.fromCharCodes(new Iterable.generate(1, (x) => char_a + 1));
    //print(nextSerial);
    return nextSerial;
  }
}
