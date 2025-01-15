import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';

class CustomTextStyles {
  // Body text styles
  static TextStyle get bodySmall10 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimary10 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 10.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimaryContainer10 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 10.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimary_1 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnSecondaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnSurface => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodyMediumOnPrimary16 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodyMediumOnSurface16 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Headline text styles
  static TextStyle get headlineSmallOnPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Label text styles
  static TextStyle get lableLargeBluegray300 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.sp,
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get lableLargeBluegray300SemiBold => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.sp,
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargeIndigoA200 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.sp,
        color: appTheme.indigoA200,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargeOnPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargeOnPrimaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargePrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelMediumBluegray300 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.sp,
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelMediumOnPrimaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelMediumPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelSmallPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Title text styles
  static TextStyle get titleLargePrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: theme.colorScheme.primary,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleLargeOnPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleLargeOnSurface => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleLargeOnSecondary {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
      color: theme.colorScheme.onSecondary.withValues(alpha: 1),
      letterSpacing: .0,
      wordSpacing: .0,
    );
  }
  static TextStyle get titleMediumOnSurface => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleMediumOnPrimaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleMediumOnSecondaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleMediumOnPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get elevatedButtonOnPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static get titleMedium => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallBluegray300 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: appTheme.blueGray300,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallOnPrimaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallOnSecondaryContainer => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallPink300 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: appTheme.pink300,
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallPrimary => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static get titleSmall_1 => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Settings Item text styles
  static TextStyle get settingsItemTitleStyle => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        fontWeight: FontWeight.w700,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get settingsItemSubtitleStyle => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 10.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
}
