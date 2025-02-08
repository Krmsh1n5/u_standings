import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:u_standings/core/shared/config.dart';
import 'package:u_standings/features/standings/data/models/standings/standings_model.dart';

final List<StandingsModel> leaderboardData = [
  StandingsModel(id: 1, cohortSemester: 'L1 CS S1', studentId: '22322111', average: 17.9, change: 2),
  StandingsModel(id: 2, cohortSemester: 'L1 CS S1', studentId: '22322222', average: 17.8, change: -1),
  StandingsModel(id: 3, cohortSemester: 'L1 CS S1', studentId: '22322555', average: 17.6, change: 1),
  StandingsModel(id: 4, cohortSemester: 'L1 CS S1', studentId: '22322333', average: 17.58, change: 0),
  StandingsModel(id: 5, cohortSemester: 'L1 CS S1', studentId: '22322444', average: 17.5, change: 0),
  StandingsModel(id: 6, cohortSemester: 'L1 CS S1', studentId: '22322666', average: 17.4, change: 0),
  StandingsModel(id: 7, cohortSemester: 'L1 CS S1', studentId: '22322574', average: 17.3, change: 0),
  StandingsModel(id: 8, cohortSemester: 'L1 CS S1', studentId: '22322628', average: 17.2, change: 0),
  StandingsModel(id: 9, cohortSemester: 'L1 CS S1', studentId: '22322592', average: 17.15, change: 0),
  StandingsModel(id: 10, cohortSemester: 'L1 CS S1', studentId: '22322000', average: 17.1, change: 0),
  StandingsModel(id: 11, cohortSemester: 'L1 CS S1', studentId: '22322579', average: 17.0, change: 0),
  StandingsModel(id: 12, cohortSemester: 'L1 CS S1', studentId: '22322888', average: 16.9, change: 0),
];

final List<String> cohortSemesterData = [
  'L0 S1',
  'L0 S2',
  'L1 CS S1',
  'L1 CS S2',
  'L1 CE S1',
  'L1 CE S2',
  'L1 PE S1',
  'L1 PE S2',
  'L1 GE S1',
  'L1 GE S2',
  'L2 CS S1',
  'L2 CS S2',
  'L2 CE S1',
  'L2 CE S2',
  'L2 PE S1',
  'L2 PE S2',
  'L2 GE S1',
  'L2 GE S2',
];

class UStandingsApi {
  Future<List<StandingsModel>> getStandings(String selectedCohortSemester) async {
    final endpoint = '${Config().apiBaseUrl}/standings/get';
    try {
      if (selectedCohortSemester.isEmpty) {
        throw Exception('Invalid cohort semester');
      }

      var queryParameters = {
        'cohortSemester': selectedCohortSemester,
      };
      var uri = Uri.parse(endpoint).replace(queryParameters: queryParameters);
      var response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        List<StandingsModel> standingsList = jsonData.map((jsonItem) => StandingsModel.fromJson(jsonItem)).toList();
        return standingsList;
      } else {
        throw Exception('Failed to load leaderboard data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load leaderboard data');
    }
    // Simulate a network delay
    // await Future.delayed(Duration(seconds: 1));
    // return leaderboardData;
  }

  Future<List<String>> getAvailableCohortSemesters() async {
    final endpoint = '${Config().apiBaseUrl}/cohortSemesters/get';
    try {
      var uri = Uri.parse(endpoint);
      var response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        List<String> cohortSemesters = List<String>.from(jsonData);
        return cohortSemesters;
      } else {
        throw Exception('Failed to load cohortSemesters data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load cohortSemesters data');
    }
    // Simulate a network delay
    // await Future.delayed(Duration(seconds: 1));
    // return cohortSemesterData;
  }

  Future<double> getKnownCredits(String selectedCohortSemester) async {
    final endpoint = '${Config().apiBaseUrl}/credits/get';
    try {
      if (selectedCohortSemester.isEmpty) {
        throw Exception('Invalid cohort semester');
      }

      var queryParameters = {
        'cohortSemester': selectedCohortSemester,
      };
      var uri = Uri.parse(endpoint).replace(queryParameters: queryParameters);
      var response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      double knownCredits = jsonData is double ? jsonData : double.tryParse(jsonData.toString()) ?? 0.0;
      return knownCredits;
      } else {
        throw Exception('Failed to load knownCredits data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load knownCredits data');
    }
    // // Simulate a network delay
    // await Future.delayed(Duration(seconds: 1));
    // return Future.value(23.7);
  }
}