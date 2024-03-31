import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/common/models/user_model.dart';
import 'package:e_shop_ui/common/screens/get_otp_screen.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

class LogoutDiagloue extends StatelessWidget {
  const LogoutDiagloue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      title: Center(
        child: Text(
          'Logout'.tr,
          style: globalTextStyle(fontSize: 16.sp),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  height: 40.h,
                  text: 'Yes',
                  textSize: 13.sp,
                  onTap: () {
                    final UserController userController = Get.find();
                    userController.currentUser.value = User();
                    Get.offAll(() => const GetOtpScreen());
                  },
                  textColor: CustomColors.primary,
                  color: CustomColors.secondary,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: CustomButton(
                  height: 40.h,
                  text: 'No',
                  textSize: 13.sp,
                  onTap: () {
                    Get.back();
                  },
                  textColor: CustomColors.primary,
                  color: CustomColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
