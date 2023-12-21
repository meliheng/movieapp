import 'package:flutter/material.dart';
import 'package:movieapp/res/app_color.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData(
      primaryColor: AppColors.orangeColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      primaryIconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
      ),

      iconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColors.whiteColor,
        centerTitle: true,
        scrolledUnderElevation: 2,
        // toolbarTextStyle: AppStyle.instance.bodyMedium,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.only(top: 0),
        prefixIconColor: AppColors.whiteColor,
        suffixIconColor: AppColors.whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: AppColors.greyColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //       primary: AppColors.redColor,
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(30))),
      // ),
      // checkboxTheme: CheckboxThemeData(
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      //     fillColor: MaterialStateProperty.all(AppColors.redColor)),
      //inputDecoration Theme
      // inputDecorationTheme: InputDecorationTheme(
      //     filled: true,
      //     fillColor: AppColors.whiteColor.withOpacity(0.1),
      //     focusedBorder: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(20.0),
      //         borderSide: const BorderSide(color: AppColors.redColor)),
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(20.0),
      //     ),
      //     hoverColor: AppColors.redColor,
      //     contentPadding: const EdgeInsets.all(20),
      //     prefixIconColor: AppColors.whiteColor.withOpacity(0.4),
      //     suffixIconColor: AppColors.whiteColor.withOpacity(0.4),
      //     hintStyle: AppStyle.instance.bodyMedium
      //         .copyWith(color: AppColors.whiteColor.withOpacity(0.4))),
    );
  }
}
