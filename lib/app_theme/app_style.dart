import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_hub/app_theme/pallet.dart';

class Styles {
  static ThemeData themeData({required bool isDark}) {
    return ThemeData(
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      unselectedWidgetColor: Colors.grey,
      useMaterial3: true,
      colorScheme: ColorScheme(
        primary: primaryColor,
        secondary: Color(0x332C2A72),
        surface: Colors.white,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onError: Colors.white,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),

      splashColor: primaryColor.withValues(alpha: 0.1),
      highlightColor: Color(0x332C2A72).withValues(alpha: 0.2),
      disabledColor: Colors.grey.shade300,
      iconTheme: IconThemeData(color: textColor),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade100,
        thickness: 1.5,
      ),

      /// TEXT THEME
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: TextStyle(color: textColor, fontSize: 16),
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        labelMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      ),

      /// INPUT THEME
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        isDense: true,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: appBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: errorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: TextStyle(color: errorColor, fontSize: 13),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: errorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),

      cardColor: Colors.white,
      canvasColor: Colors.white,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        systemOverlayStyle:
            isDark == true
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
        color: Colors.transparent,
        foregroundColor: textColor,
        iconTheme: IconThemeData(color: textColor),
        titleTextStyle: TextStyle(
          fontSize: 19.20,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      shadowColor: Colors.grey,
    );
  }
}
