import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:u_standings/core/utils/constants/cohorts_semesters_data.dart';
import 'package:u_standings/core/utils/functions/check_and_rounf_credits.dart';
import 'package:u_standings/core/utils/theme/app_decoration.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';
import 'package:u_standings/core/utils/theme/custom_button_style.dart';
import 'package:u_standings/core/utils/theme/custom_text_styles.dart';
import 'package:u_standings/features/standings/presentation/providers/calculator_notifier.dart';
import 'package:u_standings/features/standings/presentation/widgets/select_button.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                _buildHeadingAndSubheadingText(),
                SizedBox(height: 4.h),
                _buildSelectButton(context),
                SizedBox(height: 8.h),
                _buildCalculatorFields(context),
                if (provider.calculatedAverage != null)
                  Column(
                    children: [
                      buildCalculatedResultBox(context),
                      SizedBox(height: 10.h),
                    ],
                  ),
                _buildCalculateButton(context),
                SizedBox(height: 8.h),
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
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: Text("Your grade calculator awaits!",
          style: CustomTextStyles.titleLargeOnSurface),
    );
  }

  _buildHeadingAndSubheadingText() {
    return Container(
      height: 40.h,
      width: double.maxFinite,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 20.h,
            child: Text(
              "Calculator",
              style: CustomTextStyles.titleMediumOnSurface,
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
              "Select a cohort/faculty and semester",
              style: CustomTextStyles.bodySmallOnSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  _buildSelectButton(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);
    final List<String> availableCohortsSemesters = [];

    for (var cohort in cohortsSemesters) {
      if (cohort.exams.isNotEmpty) {
        availableCohortsSemesters.add(cohort.name);
      }
    }

    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: CohortSemesterSelectorButton(
        title: provider.selectedCohortSemester ?? 'Select Faculty',
        staticOptions: availableCohortsSemesters,
        onOptionSelected: (selectedOption) {
          provider.updateCohort(selectedOption);
        },
      ),
    );
  }

  _buildCalculatorFields(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);
    final exams = provider.exams ?? [];

    return ListView.builder(
      shrinkWrap: true,
      physics:
          NeverScrollableScrollPhysics(), // Prevents internal scrolling if nested in another scrollable view
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 14.h),
          child: _buildGradeInputWidget(
            title: exam['title']!,
            credits: exam['credits']!,
            context: context,
          ),
        );
      },
    );
  }

  Widget _buildGradeInputWidget({
    required String title,
    required String credits,
    required BuildContext context,
  }) {
    final provider = Provider.of<CalculatorProvider>(context);

    credits = checkAndRoundCredits(credits);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          // Title and Credits Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.labelMediumOnSurface,
                ),
                Text(
                  "Credits: $credits",
                  style: CustomTextStyles.bodySmallOnSecondaryContainer
                      .copyWith(
                          color: theme.colorScheme.onSecondaryContainer
                              .withValues(alpha: 0.5)),
                ),
              ],
            ),
          ),
          // Input Field
          Container(
            height: 40.h,
            width: 60.w,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.colorScheme.onSecondaryContainer
                    .withValues(alpha: 0.5),
                width: 1,
              ),
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              cursorColor: theme.colorScheme.onSecondaryContainer.withValues(
                alpha: 0.5,
              ),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.sp,
                  ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (value) {
                final grade = double.tryParse(value) ?? 0.0;
                provider.updateGrade(title, grade);
              },
            ),
          ),
        ],
      ),
    );
  }

  buildCalculatedResultBox(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    String averageGrade = provider.calculatedAverage.toString();

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 0.5),
          width: 0.5.h,
        ),
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Calculated Average:",
                style: CustomTextStyles.bodyMediumOnSurface16
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Text('Plan ahead and aim higher!',
                  style: CustomTextStyles.bodySmall12.copyWith(
                    color: theme.colorScheme.primary,
                  )),
            ],
          ),
          Text(averageGrade,
              style: CustomTextStyles.titleLargeOnSurface
                  .copyWith(fontSize: 24.sp)),
        ],
      ),
    );
  }

  _buildCalculateButton(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return SizedBox(
      height: 40.h,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: provider.calculateAverage,
        style: CustomButtonStyle.fillPrimary,
        child: Center(
          child: Text("Calculate",
              style: CustomTextStyles.bodyMediumOnPrimary16
                  .copyWith(letterSpacing: 0.5)),
        ),
      ),
    );
  }
}
