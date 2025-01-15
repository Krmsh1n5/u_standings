import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/features/standings/presentation/widgets/custom_appbar.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppbar(),
        bottomNavigationBar: _buildNavigationBar(),
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
      child: ElevatedButton(
        onPressed: () {},
        child: Text("CS 2023"),
      ),
    );
  }

  _buildCalculatorFields() {
    return Container(width: double.maxFinite, height: 600.h, color: Colors.red);
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

  _buildNavigationBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 10.h, 16.h, 34.h),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Standings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculator",
          ),
        ],
      ),
    );
  }
}
