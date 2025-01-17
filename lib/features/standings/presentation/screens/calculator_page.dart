import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:u_standings/features/standings/presentation/providers/calculator_notifier.dart';
import 'package:u_standings/features/standings/presentation/widgets/custom_appbar.dart';
import 'package:u_standings/features/standings/presentation/widgets/select_button.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

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
                _buildSelectButton(context),
                SizedBox(height: 4.h),
                _buildCalculatorFields(context),
                SizedBox(height: 4.h),
                if (provider.calculatedAverage != null)
                  _buildCalculatedAverageBox(context),
                SizedBox(height: 4.h),
                _buildCalculateButton(context),
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
          'Calculator',
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
        "Your grade calculator awaits!",
        style: TextStyle(
          fontSize: 20.sp,
        ),
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
              "Calculator",
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
              "Select a faculty and/or cohort",
            ),
          ),
        ],
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

  _buildSelectButton(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: CohortSemesterSelectorButton(
        title: provider.selectedCohortSemester ?? 'Select Faculty/Cohort',
        staticOptions: provider.cohortsSemesters,
        onOptionSelected: (selectedOption) {
          provider.updateCohort(selectedOption);
        },
      ),
    );
  }

  _buildCalculatorFields(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);
    final exams = provider.currentExams;

    if (exams.isEmpty) {
      return Center(
        child: Text(
          'No exams available for the selected cohort/semester.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics:
          NeverScrollableScrollPhysics(), // Prevents internal scrolling if nested in another scrollable view
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: _buildGradeInputWidget(
            title: exam['title']!,
            credits: exam['credits']!,
            context: context,
          ),
        );
      },
    );
  }

  _buildGradeInputWidget({
    required String title,
    required String credits,
    required BuildContext context,
  }) {
    final provider = Provider.of<CalculatorProvider>(context);

    return SizedBox(
      height: 70.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text("Credits: $credits"),
              ],
            ),
          ),
          SizedBox(
            width: 70.w,
            child: TextField(
              keyboardType: TextInputType.number,
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

  _buildCalculatedAverageBox(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          provider.calculatedAverage.toString(),
        ),
      ),
    );
  }

  _buildCalculateButton(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: provider.calculateAverage,
        child: Text("Calculate"),
      ),
    );
  }
}
