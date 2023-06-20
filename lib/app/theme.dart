import 'package:flutter/material.dart';

abstract class AppColors {
  static const dark = Colors.black;

  static const light = Color(0xFFFAFAFA);

  static const grey = Color(0xFF262626);

  static const primaryText = Colors.white;

  static const secondary = Color(0xFF0095F6);

  static const like = Colors.red;

  static const faded = Colors.grey;

  static const ligthGrey = Color(0xFFEEEEEE);

  static const topGradient = Color(0xFFE60064);

  static const bottomGradient = Color(0xFFFFB344);
}

abstract class AppTextStyle {
  static const textStyleBoldMedium = TextStyle(
    fontWeight: FontWeight.w600,
  );

  static const textStyleBold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const textStyleSmallBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  static const textStyleFaded =
      TextStyle(color: AppColors.faded, fontWeight: FontWeight.w400);

  static const textStyleFadedSmall = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w400, fontSize: 11);

  static const textStyleFadedSmallBold = TextStyle(
      color: AppColors.faded, fontWeight: FontWeight.w500, fontSize: 11);

  static const textStyleLight = TextStyle(fontWeight: FontWeight.w300);

  static const textStyleAction = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
  );
}

class AppTheme {
  final _darkBase = ThemeData.dark();
  final _lightBase = ThemeData.light();

  ThemeData get darkTheme => _darkBase.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.dark,
        scaffoldBackgroundColor: AppColors.dark,
        appBarTheme: _darkBase.appBarTheme.copyWith(
          backgroundColor: AppColors.dark,
          foregroundColor: AppColors.light,
          iconTheme: const IconThemeData(color: AppColors.light),
          elevation: 0,
        ),
        bottomNavigationBarTheme: _darkBase.bottomNavigationBarTheme.copyWith(
          backgroundColor: AppColors.dark,
          selectedItemColor: AppColors.light,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: AppColors.grey,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.light,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.dark,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.primaryText,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.grey,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        brightness: Brightness.dark,
        colorScheme:
            _darkBase.colorScheme.copyWith(secondary: AppColors.secondary),
      );

  ThemeData get lightTheme => _lightBase.copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.light,
        scaffoldBackgroundColor: AppColors.light,
        appBarTheme: _lightBase.appBarTheme.copyWith(
          backgroundColor: AppColors.light,
          foregroundColor: AppColors.dark,
          iconTheme: const IconThemeData(color: AppColors.dark),
          elevation: 0,
        ),
        bottomNavigationBarTheme: _lightBase.bottomNavigationBarTheme.copyWith(
          backgroundColor: AppColors.light,
          selectedItemColor: AppColors.dark,
        ),
        snackBarTheme:
            _lightBase.snackBarTheme.copyWith(backgroundColor: AppColors.dark),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.all(
              const BorderSide(
                color: AppColors.ligthGrey,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.dark,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.light,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.ligthGrey,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.primaryText,
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.ligthGrey,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              AppColors.secondary,
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            overlayColor: MaterialStateProperty.all<Color>(
              AppColors.ligthGrey,
            ),
          ),
        ),
        brightness: Brightness.light,
        colorScheme:
            _lightBase.colorScheme.copyWith(secondary: AppColors.secondary),
      );
}
