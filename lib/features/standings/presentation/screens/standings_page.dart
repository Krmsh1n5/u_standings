import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:u_standings/features/standings/domain/entities/standings.dart';
import 'package:u_standings/features/standings/presentation/providers/standings_notifier.dart';
import 'package:u_standings/features/standings/presentation/widgets/select_button.dart';

class StandingsPage extends StatefulWidget {
  const StandingsPage({super.key});

  @override
  State<StandingsPage> createState() => _StandingsPageState();
}

class _StandingsPageState extends State<StandingsPage> {
  bool isDataReady = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await Provider.of<StandingsNotifier>(context, listen: false)
          .loadAvailableCohortsSemesters();
      await Provider.of<StandingsNotifier>(context, listen: false)
          .loadCredits();
      await Provider.of<StandingsNotifier>(context, listen: false)
          .loadStandings();

      setState(() {
        isDataReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StandingsNotifier>(context);

    // Check if data is ready
    if (!isDataReady) {
      return CircularProgressIndicator(); 
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          padding:
              // Platform.isIOS
              //     ? EdgeInsets.zero : // Use only SafeArea's padding on iOS
              EdgeInsets.only(
            // Add custom padding on Android
            left: 16.h,
            top: 8.h,
            right: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitleWidget(),
                _buildCompletedExamCreditsWidget(context),
                SizedBox(height: 4.h),
                _buildHeadingAndSubheadingText(),
                SizedBox(height: 4.h),
                _buildSelectButton(context),
                SizedBox(height: 8.h),
                _buildStandingsTable(provider.standings),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
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

  _buildCompletedExamCreditsWidget(BuildContext context) {
    final provider = Provider.of<StandingsNotifier>(context);
    final completedCredits = provider.knownCredits;
    final totalCredits = provider.totalCohortSemesterCredits;

    // Calculate the percentage of completed credits
    double percentageCompleted = completedCredits! / totalCredits!;

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
              "Select a cohort/faculty and semester ",
            ),
          ),
        ],
      ),
    );
  }

  _buildSelectButton(BuildContext context) {
    final provider = Provider.of<StandingsNotifier>(context);
    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: CohortSemesterSelectorButton(
        title: provider.selectedCohortSemester ?? 'Select Faculty',
        fetchOptions: provider.cohortSemesters,
        onOptionSelected: (selectedOption) {
          provider.updateCohort(selectedOption);
        },
      ),
    );
  }

  Widget _buildStandingsTable(List<Standings> data) {
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
                      item.rank.toString(),
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
                        item.studentId,
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
                      item.average.toStringAsFixed(3),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                // Change Indicator Column
                Container(
                  width: 70.w,
                  padding: EdgeInsets.only(left: 40.w),
                  child: Align(
                    alignment: Alignment.center,
                    child: item.change != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item.change > 0
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color:
                                    item.change > 0 ? Colors.green : Colors.red,
                                size: 16.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                item.change.abs().toString(),
                                style: TextStyle(
                                  color: item.change > 0
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
