import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/screens/bottom_nav_screen.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: Get.height * 0.1,
            ),
            SizedBox(height: Get.height * 0.1),
            Text(
              '${'Payment Successfull'.tr}!',
              style: globalTextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '${'Thank you for shopping with us'.tr}!',
              style: globalTextStyle(fontSize: 13.sp),
            ),
            SizedBox(height: Get.height * 0.1),
            CustomButton(
              text: 'explore more'.tr.toUpperCase(),
              textSize: 14.sp,
              onTap: () {
                final CustomNavController customNavController = Get.find();
                customNavController.selectedTab.value = 0;

                Get.offAll(() => const BottomNavScreenBuyer());
              },
            ),
          ],
        ),
      ),
    );
  }
}
