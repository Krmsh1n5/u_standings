import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  // Body text styles
  static TextStyle get bodySmall10 => GoogleFonts.montserrat(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmall12 => GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimary => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimary10 => GoogleFonts.montserrat(
        fontSize: 10.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimaryContainer => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimaryContainer10 => GoogleFonts.montserrat(
        fontSize: 10.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnPrimary_1 => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnSecondaryContainer => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodySmallOnSurface => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodyMediumOnPrimary16 => GoogleFonts.montserrat(
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodyMediumOnPrimary16w400 => GoogleFonts.montserrat(
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get bodyMediumOnSurface16 => GoogleFonts.montserrat(
        fontSize: 16.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Headline text styles
  static TextStyle get headlineSmallOnPrimary => GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Label text styles
  static TextStyle get lableLargeBluegray300 => GoogleFonts.montserrat(
        fontSize: 20.sp,
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get lableLargeBluegray300SemiBold => GoogleFonts.montserrat(
        fontSize: 20.sp,
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargeIndigoA200 => GoogleFonts.montserrat(
        fontSize: 20.sp,
        color: appTheme.indigoA200,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargeOnPrimary => GoogleFonts.montserrat(
        fontSize: 20.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargeOnPrimaryContainer => GoogleFonts.montserrat(
        fontSize: 20.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelLargePrimary => GoogleFonts.montserrat(
        fontSize: 20.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelMediumBluegray300 => GoogleFonts.montserrat(
        fontSize: 16.sp,
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelMediumOnPrimaryContainer => GoogleFonts.montserrat(
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelMediumPrimary => GoogleFonts.montserrat(
        fontSize: 16.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelMediumOnSurface => GoogleFonts.montserrat(
        fontSize: 16.sp,
        color: theme.colorScheme.onSurface,
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get labelSmallPrimary => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Title text styles
  static TextStyle get titleLargePrimary => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: theme.colorScheme.primary,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleLargeOnPrimary => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleLargeOnSurface => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleLargeOnSecondary => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        color: theme.colorScheme.onSecondary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleMediumOnSurface => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleMediumOnPrimaryContainer => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleMediumOnSecondaryContainer =>
      GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleMediumOnPrimary => GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get elevatedButtonOnPrimary => GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        color: theme.colorScheme.onPrimary.withValues(alpha: 1),
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static get titleMedium => GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallBluegray300 => GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: appTheme.blueGray300,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallOnPrimaryContainer => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallOnSecondaryContainer => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallPink300 => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: appTheme.pink300,
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get titleSmallPrimary => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w400,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static get titleSmall_1 => GoogleFonts.montserrat(
        fontSize: 12.sp,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  // Settings Item text styles
  static TextStyle get settingsItemTitleStyle => GoogleFonts.montserrat(
        fontSize: 12.sp,
        color: theme.colorScheme.onSurface.withValues(alpha: 1),
        fontWeight: FontWeight.w700,
        letterSpacing: .0,
        wordSpacing: .0,
      );
  static TextStyle get settingsItemSubtitleStyle => GoogleFonts.montserrat(
        fontSize: 10.sp,
        color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
        fontWeight: FontWeight.w500,
        letterSpacing: .0,
        wordSpacing: .0,
      );
}
