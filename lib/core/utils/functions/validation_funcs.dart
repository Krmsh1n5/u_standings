bool isNumeric(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;
  if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
    isInputStringValid = true;
  }
  if (inputString != null && inputString.isNotEmpty) {
    final numericRegExp = RegExp(r'^[0-9]+$');
    isInputStringValid = numericRegExp.hasMatch(inputString);
  }
  return isInputStringValid;
}