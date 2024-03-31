import 'package:e_shop_ui/buyer/screens/bottom_nav_screen.dart';
import 'package:get/get.dart';

import '../../core/imports/core_imports.dart';
import '../../widgets/custom_button.dart';

class StartShoppingScreen extends StatelessWidget {
  final String name;
  const StartShoppingScreen({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/gifs/shop.gif',
                  width: 200.w,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  '${'Hello'.tr} ${name.capitalizeFirst} !',
                  style: globalTextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'You are now logged in'.tr,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: CustomColors.grayDark,
                  ),
                ),
                SizedBox(
                  height: 55.h,
                ),
                CustomButton(
                  width: Get.width * 0.8,
                  text: 'Start Shopping'.tr,
                  textSize: 16.sp,
                  onTap: () => Get.offAll(() => const BottomNavScreenBuyer()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
