class RegExpressions {
  static RegExp general = RegExp('[a-z A-Z á-ú Á-Ú 0-9 .?;% \n]');
  static RegExp onlyLettersWithSpace = RegExp('[a-z A-Z]');
  static RegExp onlyLettersWithSpaceExtendedLatin = RegExp('[a-z A-Z á-ú Á-Ú]');
  static RegExp onlyLettersNumbersWithSpace = RegExp('[a-z A-Z 0-9]');
  static RegExp onlyLettersNumbersWithSpaceExtendedLatin =
      RegExp('[a-z A-Z á-ú Á-Ú 0-9]');
  static RegExp onlyLetters = RegExp('[a-zA-Z]');
  static RegExp onlyCapitalLettersNumbers = RegExp('[a-zA-Z0-9]');
  static RegExp onlyNumbers = RegExp('[0-9]');
  static RegExp emailText = RegExp('[a-z A-Z á-ú Á-Ú 0-9 @.]');
  static RegExp allowedText = RegExp('[a-z A-Z 0-9 . \n]');
  static RegExp bannedCharacters = RegExp(r'[<>:"/\\|?*]');
  static RegExp endWithDot = RegExp(r'[.]+$');
}
