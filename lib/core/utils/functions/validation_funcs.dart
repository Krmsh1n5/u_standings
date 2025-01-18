bool isGradeValid(double grade) {
  if (grade < 0 || grade > 20) {
    // Invalid input
    return false;
  } else {
    // Valid input
    return true;
  }
}
