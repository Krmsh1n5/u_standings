import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:u_standings/core/utils/pref_utils/pref_utils.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';
import 'package:u_standings/features/standings/presentation/providers/calculator_notifier.dart';
import 'package:u_standings/features/standings/presentation/screens/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
      ],
      child: UStandingsApp(),
    ),
  );
}

class UStandingsApp extends StatelessWidget {
  const UStandingsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PrefUtils.prefsTheme =
        Theme.of(context).brightness == Brightness.light ? 'light' : 'dark';
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'U Standings',
        theme: theme,
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}
