import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/core/utils/theme/app_decoration.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';
import 'package:u_standings/features/standings/presentation/screens/calculator_page.dart';
import 'package:u_standings/features/standings/presentation/screens/standings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    StandingsPage(),
    CalculatorPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(14.h, 8.h, 14.h, 32.h),
          child: Container(
            padding: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadiusStyle.roundedBorder8,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.onSurface
                        .withValues(alpha: 0.24),
                    blurRadius: 5.h,
                    offset: Offset(0, 4.h),
                  ),
                ]),
            child: BottomNavigationBar(
              unselectedItemColor: theme.colorScheme.onSecondaryContainer,
              backgroundColor: theme.colorScheme.surface,
              elevation: 0,
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard),
                  label: "Leaderboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calculate),
                  label: "Calculator",
                ),
              ],
            ),
          )),
    );
  }
}
