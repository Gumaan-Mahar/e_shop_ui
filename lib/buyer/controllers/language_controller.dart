import 'dart:developer';

import 'package:get/get.dart';

import '../../core/imports/core_imports.dart';

class LanguageController extends GetxController {


  @override
  void onInit() {
  log('selected locale ${Get.locale}');

    super.onInit();
  }


  void updateLocale(Locale locale) async {
    await Get.updateLocale(locale);
  }
}
