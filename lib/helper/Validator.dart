class Validator{

  static final RegExp _checkHouseholdID = RegExp(
    r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,30}$',
  );

  static isValidHouseholdID(String hhid){
    return _checkHouseholdID.hasMatch(hhid);
  }

  static final RegExp _checkIndividualID = RegExp(
    r'^[0-9]{4}$',
  );

  static isValidIndividualID(String individualID){
    return _checkIndividualID.hasMatch(individualID);
  }
}