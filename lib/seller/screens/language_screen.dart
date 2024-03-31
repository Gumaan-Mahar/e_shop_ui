import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';

import '../controllers/language_controller.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageController());
    return Scaffold(
      appBar: const CustomAppBar(hasBackButton: true, title: 'Language'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose the language you'd like to browse the app in".tr,
              style: globalTextStyle(
                  fontSize: 12.sp, color: CustomColors.primaryDark),
            ),
            SizedBox(height: 15.h),
            ListTile(
              title: Text(
                'English (United States)'.tr,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: CustomColors.primaryDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => controller.updateLocale(const Locale('en_US')),
              trailing: Get.locale == const Locale('en_US')
                  ? const Icon(
                      FlutterRemix.check_line,
                      color: CustomColors.primary,
                    )
                  : const SizedBox(),
            ),
            const Divider(
              color: CustomColors.borderColor,
            ),
            ListTile(
              title: Text(
                'Arabic'.tr,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: CustomColors.primaryDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () => controller.updateLocale(const Locale('ur')),
              trailing: Get.locale == const Locale('ur')
                  ? const Icon(
                      FlutterRemix.check_line,
                    )
                  : const SizedBox(),
            ),
            const Divider(
              color: CustomColors.borderColor,
            )
          ],
        ),
      ),
    );
  }
}
