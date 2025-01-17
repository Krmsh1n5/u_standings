Future<List<String>> fetchCohortsSemestersFromDatabase() async {
  // Simulate fetching data from API/DB
  await Future.delayed(Duration(seconds: 1)); // Simulate network delay
  return ['Cohort A', 'Cohort A - CS', 'Cohort A - CE','Cohort B', 'Cohort C', 'Cohort C - GE', 'Cohort D', 'Cohort D - GE'];
}
