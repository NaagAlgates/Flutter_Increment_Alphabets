class Validator{

  static final RegExp _checkHouseholdID = RegExp(
    r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\S+$).{8,30}$',
  );
}