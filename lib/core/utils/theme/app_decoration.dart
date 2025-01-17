import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_standings/core/utils/theme/app_theme.dart';
import 'package:u_standings/core/utils/theme/custom_text_styles.dart';


class AppDecoration {
  // Background decoration
  static BoxDecoration get backgroundwhite => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
      );
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigoA200,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  // Outline decorations
  static BoxDecoration get outlineBlue => BoxDecoration(
        border: Border.all(color: appTheme.blue50, width: 1.h),
      );
  static BoxDecoration get outlineBlue50 => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        border: Border.all(
          color: appTheme.blue50,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlue501 => BoxDecoration(
        color: appTheme.blue50,
        border: Border.all(
          color: appTheme.blue50,
          width: 1.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 1),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineOnSecondaryContainer => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 0.5),
          width: 0.5.h,
        ),
      );
  // Input decoration
  InputDecoration dropdownButtonFormFieldDecoration(
          String labelText, int? value) =>
      InputDecoration(
        labelText: value == null ? null : labelText,
        labelStyle: CustomTextStyles.bodySmallOnSurface,
        filled: true,
        fillColor: theme.colorScheme.onPrimary.withValues(alpha: 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          borderSide: BorderSide(
            color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.onSecondaryContainer.withValues(alpha: 1),
            width: 0.5,
          ),
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
      );
  // Button decoration
  ButtonStyle elevatedButtonStyle(bool isFormFilled) {
    return ButtonStyle(
      fixedSize: WidgetStateProperty.all<Size>(
        Size(double.maxFinite, 45.h),
      ),
      padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry?>(
        (states) => EdgeInsets.all(4.h),
      ),
      elevation: WidgetStateProperty.all(2.0),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
        (states) => isFormFilled
            ? theme.colorScheme.primary
            : theme.colorScheme.primary.withValues(alpha: 0.5),
      ),
      shadowColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withValues(alpha: 0.8)),
    );
  }
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder24 => BorderRadius.circular(
        24.h,
      );
  static BorderRadius get circleBorderTop24 => BorderRadius.only(
        topLeft: Radius.circular(24.h),
        topRight: Radius.circular(24.h),
      );
  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36.h,
      );
  // Rounded borders
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}
