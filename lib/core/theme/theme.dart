import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:todo_app/app.dart';
import 'app_colors.dart';

class CustomAppTheme {
  CustomAppTheme._internal();

  static final CustomAppTheme instance = CustomAppTheme._internal();

  /* edit light theme to suit project's design (optional) */
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        useMaterial3: false,
        fontFamily: GoogleFonts.changa().fontFamily,
        checkboxTheme: CheckboxThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.white,
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            fillColor: AppColors.gray,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.transparent),
            )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                side: WidgetStateProperty.all(
                    const BorderSide(color: AppColors.accent, width: 1.5)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                foregroundColor: WidgetStateProperty.all(AppColors.accent))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.accent;
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.gray;
                  }
                  return AppColors.accent.withOpacity(0.9);
                }))),
        buttonTheme: ButtonThemeData(
            buttonColor: AppColors.primary,
            disabledColor: AppColors.gray.withOpacity(0.2)),
        hintColor: AppColors.darkGray,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: AppColors.darkGray),
        brightness: Brightness.light,
        dialogBackgroundColor: AppColors.white,
        dialogTheme: DialogTheme(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            color: AppColors.white),
        cardTheme: CardTheme(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        colorScheme: Theme.of(context).colorScheme.copyWith(
            background: AppColors.white,
            brightness: Brightness.light,
            primary: AppColors.primary,
            secondary: AppColors.accent));
  }

  /* edit dark theme to suit project's design (optional) */
  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
        useMaterial3: false,
        fontFamily: GoogleFonts.changa().fontFamily,
        primaryColor: AppColors.primary,
        hintColor: Colors.white,
        checkboxTheme: CheckboxThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            fillColor: Colors.transparent,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                side: WidgetStateProperty.all(
                    const BorderSide(color: AppColors.primary, width: 1.5)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                foregroundColor: WidgetStateProperty.all(AppColors.primary))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return AppColors.primary;
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.gray;
                  }
                  return AppColors.primary.withOpacity(0.9);
                }))),
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.accent,
            buttonColor: AppColors.accent,
            disabledColor: AppColors.accent.withOpacity(0.2)),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.white),
        brightness: Brightness.dark,
        dialogBackgroundColor: AppColors.bgDark,
        dividerColor: Colors.white,
        dialogTheme: DialogTheme(
            backgroundColor: AppColors.bgDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        canvasColor: AppColors.bgDark,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            color: AppColors.bgDark),
        cardTheme: CardTheme(
            color: AppColors.bgDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        colorScheme: Theme.of(context).colorScheme.copyWith(
            background: AppColors.bgDark,
            brightness: Brightness.dark,
            primary: AppColors.primary,
            secondary: AppColors.accent));
  }

  void changeTheme(BuildContext context) =>
      ThemeProvider.controllerOf(context).nextTheme();

  void setLight(BuildContext context) =>
      ThemeProvider.controllerOf(context).setTheme("light_theme");

  void setDark(BuildContext context) =>
      ThemeProvider.controllerOf(context).setTheme("dark_theme");
}
