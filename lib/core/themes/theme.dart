import 'package:e_shop_ui/core/imports/core_imports.dart';

ThemeData appTheme = ThemeData.light(useMaterial3: false).copyWith(
  primaryColor: CustomColors.primary,
  scaffoldBackgroundColor: CustomColors.secondary,
  appBarTheme: const AppBarTheme(
    color: CustomColors.secondary,
    shadowColor: Colors.black,
    elevation: 1,
  ),
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: CustomColors.secondary,
    accentColor: CustomColors.primary,
    primarySwatch: const MaterialColor(
      0xFF000000,
      {
        50: CustomColors.primary,
        100: CustomColors.primary,
        200: CustomColors.primary,
        300: CustomColors.primary,
        400: CustomColors.primary,
        500: CustomColors.primary,
        600: CustomColors.primary,
        700: CustomColors.primary,
        800: CustomColors.primary,
        900: CustomColors.primary,
      },
    ),
  ),
);
