import 'package:e_shop_ui/core/imports/core_imports.dart';

TextStyle globalTextStyle(
        {required double fontSize,
        Color? color,
        double? letterSpacing,
        FontWeight? fontWeight,
        TextDecoration? decoration}) =>
    TextStyle(
      color: color ?? Colors.black54,
      fontSize: fontSize,
      letterSpacing: letterSpacing ?? 0.5,
      fontWeight: fontWeight ?? FontWeight.w500,
      fontFamily: 'ClashDisplay',
      decoration: decoration ?? TextDecoration.none,
    );
