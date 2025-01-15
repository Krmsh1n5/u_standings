import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/core/utils/pref_utils/pref_utils.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  final String _appTheme =
      PrefUtils.prefsTheme == 'dark' ? 'darkCode' : 'lightCode';

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
    'darkCode': DarkCodeColors(),
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
    'darkCode': ColorSchemes.darkCodeColorScheme,
  };

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          colorScheme.onPrimaryContainer.withValues(alpha: 1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          shadowColor: colorScheme.primary.withValues(alpha: 0.24),
          elevation: 10,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          side: BorderSide(
            color: _getThemeColors().blue50,
            width: 1.h,
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: _getThemeColors().blue50,
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF40BFFF),
    onPrimary: Color(0XFFFCFCFC),
    onPrimaryContainer: Color(0X7FFFFFFF),
    secondaryContainer: Color(0XFF53D1B6),
    onSecondaryContainer: Color(0XFF9098B1),
    surface: Color(0XFFFCFCFC),
    onSurface: Color.fromARGB(255, 0, 0, 0),
    onSurfaceVariant: Color(0XFF9098B1),
    onSecondary: Color(0X7F223263),
    error: Color.fromARGB(255, 239, 68, 68),
    onError: Color(0XFFFFC732),
    tertiary: Color(0XFF48C78E),
  );

  static const darkCodeColorScheme = ColorScheme.dark(
    primary: Color(0XFF1565C0),
    onPrimary: Color(0XFF1E1E1E),
    secondaryContainer: Color(0XFF039BE5),
    onSecondaryContainer: Color(0XFFFEFEFE),
    surface: Color(0XFF1E1E1E),
    onSurface: Color(0XFFFCFCFC),
    error: Color.fromARGB(255, 239, 68, 68),
    onError: Color(0XFFFFC732),
  );
}

class LightCodeColors {
  Color get amber500 => const Color(0XFFFFC107);
  Color get blue50 => const Color(0XFFEAEFFF);
  Color get blue800 => const Color(0XFF1565C0);
  Color get blueA200 => const Color(0XFF4091FF);
  Color get blueGray300 => const Color(0XFF9098B1);
  Color get gray400 => const Color(0XFFC4C4C4);
  Color get gray50 => const Color(0XFFFCFCFC);
  Color get indigo800 => const Color(0XFF283593);
  Color get indigoA200 => const Color(0XFF5B61F4);
  Color get lightBlue600 => const Color(0XFF039BE5);
  Color get pink300 => const Color(0XFFFB7181);
  Color get whiteA700 => const Color(0XFFFEFEFE);
  Color get yellow700 => const Color(0XFFFFC732);
}

class DarkCodeColors extends LightCodeColors {
  @override
  Color get blue50 => const Color(0XFF2D2D2D);
  @override
  Color get gray50 => const Color(0XFF1E1E1E);
  @override
  Color get whiteA700 => const Color(0XFFBDBDBD);
}
