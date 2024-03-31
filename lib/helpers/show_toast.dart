import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

void showToast(String message,
        {SnackPosition? position, String? status = 'success'}) =>
    Get.rawSnackbar(
      message: message.tr,
      maxWidth: Get.width * 0.8,
      snackPosition: position ?? SnackPosition.TOP,
      backgroundColor:
          status == 'error' ? Colors.red.shade400 : Colors.black,
      borderRadius: 14,
      duration: const Duration(seconds: 1),
      barBlur: 10,
      overlayBlur: 1,
      shouldIconPulse: false,
      icon: Padding(
        padding: EdgeInsets.only(
            left: Get.locale!.languageCode == 'ur' ? 0 : 15.0,
            right: Get.locale!.languageCode == 'ur' ? 15.0 : 0),
        child: Icon(
          status == 'success'
              ? FlutterRemix.check_fill
              : status == 'error'
                  ? FlutterRemix.error_warning_fill
                  : FlutterRemix.information_fill,
          color: Colors.white,
        ),
      ),
    );
