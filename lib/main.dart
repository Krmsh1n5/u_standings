import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:u_standings/core/di/service_locator.dart';
import 'package:u_standings/core/utils/pref_utils/pref_utils.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';
import 'package:u_standings/features/standings/presentation/providers/calculator_notifier.dart';
import 'package:u_standings/features/standings/presentation/providers/standings_notifier.dart';
import 'package:u_standings/features/standings/presentation/screens/home_page.dart';

void main() async {
    if (kReleaseMode) {
    await dotenv.load(fileName: 'assets/.env.prod');
  } else {
    await dotenv.load(fileName: 'assets/.env.dev');
  }
  
  setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => serviceLocator<CalculatorProvider>()),
        ChangeNotifierProvider(
            create: (_) => serviceLocator<StandingsNotifier>()),
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
