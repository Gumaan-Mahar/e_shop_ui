import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/component/logout_dialgoue.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/privacy_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/terms_screen.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/seller/screens/become_seller_screen.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

import '../../controllers/profile_screen_controller.dart';
import '../language_screen.dart';
import 'vendor_agreement_screen.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileScreenController());
    final userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondary,
        elevation: 1,
        leadingWidth: Get.width,
        shadowColor: Colors.black,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  '${'Hi'.tr} ${userController.currentUser.value.seller!.name!.capitalizeFirst}!',
                  style: globalTextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0.h),
              child: Text(
                'Account'.tr,
                style: globalTextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'My Profile'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.to(() => BecomeSellerScreen(
                      navigateTo: () => Get.back(),
                    ));
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            ListTile(
              title: Text(
                'Orders'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                final CustomNavController customNavController = Get.find();
                customNavController.selectedTab(1);
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            ListTile(
              title: Text(
                'Language'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.to(() => const LanguageScreen());
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            ListTile(
              title: Text(
                'Logout'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.dialog(
                  const LogoutDiagloue(),
                );
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            Padding(
              padding: EdgeInsets.all(15.0.h),
              child: Text(
                'Legal Information'.tr,
                style: globalTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Terms & Conditions'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.to(() => const TermsScreen());
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            ListTile(
              title: Text(
                'Privacy Policy'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.to(() => const Privacy());
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            ListTile(
              title: Text(
                "Vendor Agreement".tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.to(() => const VendorAgreementScreen());
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Center(
                child: Text(
                  'Contact Us'.tr,
                  style: globalTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Phone'.tr,
                    icon: FlutterRemix.phone_line,
                    color: CustomColors.secondary,
                    textColor: CustomColors.primary,
                    width: Get.width * 0.4,
                    height: 40.h,
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomButton(
                    icon: FlutterRemix.mail_open_line,
                    text: 'Email'.tr,
                    color: CustomColors.secondary,
                    textColor: CustomColors.primary,
                    width: Get.width * 0.4,
                    height: 40.h,
                  ),
                ],
              ),
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(20.0.h),
                child: CustomButton(
                  text: 'Delete Account'.tr,
                  color: CustomColors.secondary,
                  textColor: CustomColors.red,
                  borderColor: CustomColors.red,
                  width: Get.width * 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
