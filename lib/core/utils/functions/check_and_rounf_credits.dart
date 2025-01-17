String checkAndRoundCredits(String credits) {
  final double? value = double.tryParse(credits);

  if (value == null) {
    return credits;
  }

  if (value % 1 == 0) {
    return value.toInt().toString();
  }

  final String valueString = value.toString();
  final int decimalIndex = valueString.indexOf('.');

  if (decimalIndex != -1 && valueString.length - decimalIndex - 1 > 3) {
    return value.toStringAsFixed(3); // Round to 3 decimal places
  }
  return credits;
}
