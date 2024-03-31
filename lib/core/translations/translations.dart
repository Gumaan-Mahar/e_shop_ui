import 'package:get/get.dart';


import 'ur.dart';
import 'en.dart';

class CustomTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ur': ur,
      };
}
