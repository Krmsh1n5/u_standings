import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/features/standings/presentation/widgets/custom_appbar.dart';
import 'package:u_standings/features/standings/presentation/widgets/select_button.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});
  

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 4.h),
                _buildCalculatorFields(),
                SizedBox(height: 4.h),
                _buildCalculateButton(),
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

  _buildSelectButton() {
    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: CohortSemesterSelectorButton(
        title: 'Select Cohort',
        staticOptions: ['L0', 'L1 - CS', 'L1 - CE', 'L2', 'L3'],
        onOptionSelected: (selectedOption) {
          print('Selected in Standings: $selectedOption');
          // Handle selection (e.g., update Provider)
        },
      ),
    );
  }

  _buildCalculatorFields() {
    // Example data for the list
    final List<Map<String, String>> exams = [
      {'title': 'AOM: First Written Exam', 'credits': '0.67'},
      {'title': 'Mathematics: Midterm', 'credits': '1.00'},
      {'title': 'Physics: Lab', 'credits': '0.50'},
      {'title': 'CS: Final', 'credits': '1.00'},
      {'title': 'English: Presentation', 'credits': '0.33'},
      {'title': 'History: Midterm', 'credits': '0.50'},
      {'title': 'PE: Final', 'credits': '0.50'},
    ];

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
          ),
        );
      },
    );
  }

  _buildGradeInputWidget({required String title, required String credits}) {
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
            ),
          ),
        ],
      ),
    );
  }

  _buildCalculateButton() {
    return SizedBox(
      height: 32.h,
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Calculate"),
      ),
    );
  }
}
