import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/core/utils/functions/fetch_semesters_cohorts_func.dart';
import 'package:u_standings/features/standings/presentation/widgets/custom_appbar.dart';
import 'package:u_standings/features/standings/presentation/widgets/select_button.dart';

class StandingsPage extends StatelessWidget {
  const StandingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaderboardData = [
      {'rank': 1, 'name': 'John Doe', 'score': 17.9, 'change': 2},
      {'rank': 2, 'name': 'Jane Doe', 'score': 17.8, 'change': -1},
      {'rank': 3, 'name': '22322555', 'score': 17.6, 'change': 1},
      {'rank': 4, 'name': 'James Brown', 'score': 17.58, 'change': 0},
      {'rank': 5, 'name': 'Lebron James', 'score': 17.5, 'change': 0},
      {'rank': 6, 'name': 'James Harden', 'score': 17.4, 'change': 0},
      {'rank': 7, 'name': '22322574', 'score': 17.3, 'change': 0},
      {'rank': 8, 'name': 'Toghrul Mardiyev', 'score': 17.2, 'change': 0},
      {'rank': 9, 'name': 'Veli Tahmazov', 'score': 17.15, 'change': 0},
      {'rank': 10, 'name': 'Kamal Yalchin', 'score': 17.1, 'change': 0},
      {'rank': 11, 'name': '22322579', 'score': 17.0, 'change': 0},
      {'rank': 12, 'name': 'Farid Valiev', 'score': 16.9, 'change': 0},
    ];

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(),
        body: Container(
          width: double.infinity,
          padding:
              // Platform.isIOS
              //     ? EdgeInsets.zero : // Use only SafeArea's padding on iOS
              EdgeInsets.only(
            // Add custom padding on Android
            left: 16.h,
            right: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitleWidget(),
                _buildCompletedExamCreditsWidget(),
                SizedBox(height: 4.h),
                _buildHeadingAndSubheadingText(),
                SizedBox(height: 4.h),
                _buildSelectButton(),
                SizedBox(height: 8.h),
                _buildStandingsTable(leaderboardData),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAppbar() {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Text(
          'U Standings',
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh_rounded),
          onPressed: () {},
        ),
      ],
    );
  }

  _buildTitleWidget() {
    return Container(
      width: double.maxFinite,
      height: 48.h,
      alignment: Alignment.centerLeft,
      child: Text(
        "Explore the leaderboard rankings!",
        style: TextStyle(
          fontSize: 20.sp,
        ),
      ),
    );
  }

  _buildCompletedExamCreditsWidget() {
    // Example data for completed and total credits
    double completedCredits = 18;
    double totalCredits = 30;

    // Calculate the percentage of completed credits
    double percentageCompleted = completedCredits / totalCredits;

    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 20.h,
            child: Text(
              "Completed Exam Credits",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Expanded(
                flex: (percentageCompleted * 100).toInt(),
                child: Container(
                  height: 25.h,
                  color: Colors.blue[400],
                  alignment: Alignment.center,
                  child: Text(
                    "$completedCredits / $totalCredits",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: ((1 - percentageCompleted) * 100).toInt(),
                child: Container(
                  height: 25.h,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildHeadingAndSubheadingText() {
    return SizedBox(
      height: 40.h,
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 20.h,
            child: Text(
              "Leaderboard",
            ),
          ),
          SizedBox(
            height: 4.h,
            width: double.maxFinite,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 16.h,
            child: Text(
              "Select a faculty and/or a cohort",
            ),
          ),
        ],
      ),
    );
  }

  _buildSelectButton() {
    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: CohortSemesterSelectorButton(
        title: 'Select Cohort',
        fetchOptions: fetchCohortsSemestersFromDatabase,
        onOptionSelected: (selectedOption) {
          print('Selected in Standings: $selectedOption');
          // Handle selection (e.g., update Provider)
        },
      ),
    );
  }

  Widget _buildStandingsTable(List<Map<String, dynamic>> data) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: data.map((item) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Rank Column
                SizedBox(
                  width: 50.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['rank'].toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // Name Column
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item['name'],
                        style: TextStyle(fontSize: 16.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                // Score Column
                SizedBox(
                  width: 50.w,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      item['score'].toStringAsFixed(2),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                // Change Indicator Column
                SizedBox(
                  width: 70.w,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: item['change'] != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                item['change'] > 0
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: item['change'] > 0
                                    ? Colors.green
                                    : Colors.red,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                item['change'].abs().toString(),
                                style: TextStyle(
                                  color: item['change'] > 0
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            '-',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
