import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/profile_controller.dart';
import 'package:e_shop_ui/buyer/screens/add_address_screen.dart';
import 'package:e_shop_ui/buyer/screens/my_orders_screen/my_orders_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/buyer_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/component/logout_dialgoue.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/feedback_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/language_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/my_profile_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/privacy_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/terms_screen.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/seller/screens/become_seller_screen.dart';
import 'package:e_shop_ui/seller/screens/bottom_nav_screen.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

import '../my_favorites_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    final UserController userController = Get.find();
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
                  '${'Hi'.tr} ${userController.currentUser.value.name!.capitalizeFirst}!',
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
                Get.to(() => const MyProfileScreen());
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
              onTap: () => Get.to(() => const MyOrdersScreen()),
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
                'My Favourites'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () => Get.to(() => const MyFavoritesScreen()),
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            ListTile(
              title: Text(
                'My Address'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () => Get.to(() => const AddAddressScreen()),
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            ListTile(
              title: Text(
                'Feedback / Issue'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.to(() => const FeedbackScreen());
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
                "Buyer's Protection".tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () {
                Get.to(() => const BuyerProtectionScreen());
              },
            ),
            const Divider(
              color: CustomColors.primaryDark,
            ),
            Padding(
              padding: EdgeInsets.all(15.0.h),
              child: Text(
                'Join Us'.tr,
                style: globalTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Become a Seller'.tr,
                style: globalTextStyle(fontSize: 14.sp),
              ),
              trailing: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
              ),
              onTap: () => Get.to(
                () => BecomeSellerScreen(
                  navigateTo: () {
                    final CustomNavController controller = Get.find();
                    controller.selectedTab(0);
                    Get.offAll(() => const BottomNavScreen());
                  },
                ),
              ),
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
                    textSize: 14.sp,
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
                    textSize: 14.sp,
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
                  textSize: 14.sp,
                  width: Get.width * 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
