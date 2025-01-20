import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:u_standings/core/utils/theme/app_decoration.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';
import 'package:u_standings/core/utils/theme/custom_text_styles.dart';
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
      return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
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
        "Explore the leaderboard!",
        style: CustomTextStyles.titleLargeOnSurface,
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
              style: CustomTextStyles.titleMediumOnSurface
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Stack(
            children: [
              // Background bar
              Container(
                height: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.circleBorder24,
                  color: theme.colorScheme.onSecondaryContainer
                      .withValues(alpha: 0.5),
                ),
              ),
              // Foreground bar representing progress
              FractionallySizedBox(
                widthFactor: percentageCompleted,
                child: Container(
                  height: 25.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.circleBorder24,
                    color: theme.colorScheme.primary,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "$completedCredits / $totalCredits",
                      style: CustomTextStyles.bodySmallOnPrimary
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
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
              style: CustomTextStyles.titleMediumOnSurface
                  .copyWith(fontWeight: FontWeight.w600),
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
              style: CustomTextStyles.bodySmallOnSecondaryContainer.copyWith(
                color: theme.colorScheme.onSecondaryContainer
                    .withValues(alpha: 0.5),
              ),
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
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        children: data.asMap().entries.map((entry) {
          final int index = entry.key;
          final Standings item = entry.value;
          final bool isLastItem = index == data.length - 1;

          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.h),
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
                          style: CustomTextStyles.bodyMediumOnSurface16,
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
                            style: CustomTextStyles.bodyMediumOnSurface16,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    // Score Column
                    SizedBox(
                      width: 55.w,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          item.average.toStringAsFixed(3),
                          style: CustomTextStyles.bodyMediumOnSurface16,
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
                                  item.change > 0
                                      ? Text(
                                          String.fromCharCode(
                                              Icons.arrow_upward.codePoint),
                                          style: TextStyle(
                                            inherit: false,
                                            color: theme.colorScheme.tertiary,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                Icons.arrow_upward.fontFamily,
                                            package:
                                                Icons.arrow_upward.fontPackage,
                                          ),
                                        )
                                      : Text(
                                          String.fromCharCode(
                                              Icons.arrow_downward.codePoint),
                                          style: TextStyle(
                                            inherit: false,
                                            color: theme.colorScheme.error,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                Icons.arrow_downward.fontFamily,
                                            package: Icons
                                                .arrow_downward.fontPackage,
                                          ),
                                        ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    item.change.abs().toString(),
                                    style: CustomTextStyles
                                        .bodyMediumOnSurface16
                                        .copyWith(
                                      color: item.change > 0
                                          ? theme.colorScheme.tertiary
                                          : theme.colorScheme.error,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                '-',
                                style: CustomTextStyles.bodyMediumOnSurface16
                                    .copyWith(
                                  color: theme.colorScheme.onSurface
                                      .withValues(alpha: 0.5),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLastItem)
                Divider(
                  thickness: 1,
                  color: theme.colorScheme.onSecondaryContainer.withValues(
                    alpha: 0.5,
                  ),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
