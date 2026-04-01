import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData appTheme = ThemeData(
    //todo: this line will be change on marge and will be AppConstants.fontFamily
    fontFamily: AppTextStyles.fontFamily,
    // colorScheme
    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      primary: AppColors.primaryColor,
      onPrimary: AppColors.whiteColor,
      primaryContainer: AppColors.lightBlueColor,
      onPrimaryContainer: AppColors.primaryColor,
      primaryFixed: AppColors.babyBlueColor,

      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.whiteColor,
      secondaryContainer: AppColors.whiteColor,
      onSecondaryContainer: AppColors.secondaryColor,

      tertiary: AppColors.successColor,
      onTertiary: AppColors.whiteColor,
      tertiaryContainer: AppColors.lightGreenColor,
      onTertiaryContainer: AppColors.successColor,
      onTertiaryFixed: AppColors.selectedAnswerColor,

      error: AppColors.errorColor,
      onError: AppColors.whiteColor,
      errorContainer: AppColors.lightRedColor,
      onErrorContainer: AppColors.errorColor,

      surface: AppColors.whiteColor,
      onSurface: AppColors.blackColor,
      surfaceContainerHighest: AppColors.lightBlueColor,
      //surfaceVariant
      onSurfaceVariant: AppColors.secondaryColor,
    ),
    // inputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      // textField border styles
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.placeHolderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      // textField text styles
      hintStyle: AppTextStyles.textStyleRegular14.copyWith(
        color: AppColors.placeHolderColor,
      ),
      labelStyle: AppTextStyles.textStyleRegular12,
      errorStyle: AppTextStyles.textStyleRegular12,
      // textField floating label behavior
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    // ButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // make the button expand to the max width of its parent
        minimumSize: Size(double.infinity, 48),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        textStyle: AppTextStyles.textStyleMedium16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        side: BorderSide(color: AppColors.primaryColor),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // make the button expand to the max width of its parent
        minimumSize: Size(double.infinity, 48),
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyles.textStyleMedium16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: AppColors.primaryColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyles.textStyleRegular16.copyWith(
          decoration: TextDecoration.underline,
          decorationThickness: 2,
        ),
      ),
    ),
    // textTheme
    textTheme: const TextTheme(
      // appBar title
      titleLarge: AppTextStyles.textStyleMedium20,
      // section title
      titleMedium: AppTextStyles.textStyleMedium18,
      // navigation bar text
      titleSmall: AppTextStyles.textStyleSemiBold12,
      // ? it have one use in the app => exam name in start exam page
      headlineLarge: AppTextStyles.textStyleSemiBold20,
      // exam time text
      headlineSmall: AppTextStyles.textStyleRegular13,
      // button text
      headlineMedium: AppTextStyles.textStyleMedium16,
      //? it have one use in the app => time out Dialog text
      labelLarge: AppTextStyles.textStyleRegular24,
      // exam time counter text
      labelMedium: AppTextStyles.textStyleRegular20,
      displayLarge: AppTextStyles.textStyleMedium14,
      displaySmall: AppTextStyles.textStyleMedium12,
      labelSmall: AppTextStyles.textStyleMedium13,
      bodyLarge: AppTextStyles.textStyleRegular16,
      bodyMedium: AppTextStyles.textStyleRegular14,
      bodySmall: AppTextStyles.textStyleRegular12,
    ),
    // AppBarTheme
    appBarTheme: AppBarTheme(
      titleSpacing: 8,
      leadingWidth: 22,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      titleTextStyle: AppTextStyles.textStyleMedium20.copyWith(
        color: AppColors.blackColor,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 60,
      indicatorColor: AppColors.primaryColor.withValues(alpha: 0.12),
      labelTextStyle: WidgetStateProperty.all(
        AppTextStyles.textStyleMedium14.copyWith(color: AppColors.primaryColor),
      ),
      labelPadding: const EdgeInsets.only(top: 5),
    ),

    checkboxTheme: CheckboxThemeData(
      side: BorderSide(color: AppColors.primaryColor, width: 2),
    ),

    radioTheme: RadioThemeData(
      side: BorderSide(color: AppColors.primaryColor, width: 2),
    ),
  );
}
