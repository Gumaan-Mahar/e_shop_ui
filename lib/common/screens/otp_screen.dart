import 'package:e_shop_ui/common/controllers/otp_controller.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../core/imports/core_imports.dart';
import '../../widgets/custom_button.dart';
import '../controllers/user_controller.dart';
import 'user_details_screen.dart';

class OtpScreen extends GetView<OtpController> {
  final String number;
  const OtpScreen({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());
    final focusNode = FocusNode();
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 45.h,
      textStyle: globalTextStyle(
        fontSize: 22.sp,
        color: CustomColors.primary,
      ),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56.w,
          height: 1.h,
          decoration: BoxDecoration(
            color: CustomColors.primary,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56.w,
          height: 1.h,
          decoration: BoxDecoration(
            color: CustomColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(
            top: 60.h,
            bottom: 5.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Get.locale == const Locale('en_US')
                            ? Icon(
                                FlutterRemix.arrow_drop_left_line,
                                size: 20.dg,
                              )
                            : Icon(
                                FlutterRemix.arrow_drop_right_line,
                                size: 20.dg,
                              ),
                        Text(
                          'BACK'.tr,
                          style: globalTextStyle(fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verify your number'.tr,
                          style: globalTextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          '${'We have sent the code to +92'.tr} $number',
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: CustomColors.grayDark,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 60.h),
                          child: Center(
                            child: Pinput(
                              length: 6,
                              pinAnimationType: PinAnimationType.fade,
                              controller: controller.pinController,
                              focusNode: focusNode,
                              autofocus: true,
                              defaultPinTheme: defaultPinTheme,
                              showCursor: true,
                              cursor: cursor,
                              preFilledWidget: preFilledWidget,
                              closeKeyboardWhenCompleted: false,
                              errorPinTheme: PinTheme(
                                width: 56.w,
                                height: 45.h,
                                textStyle: globalTextStyle(
                                  fontSize: 22.sp,
                                  color: CustomColors.red,
                                ),
                              ),
                              errorTextStyle: globalTextStyle(
                                fontSize: 11.sp,
                                color: CustomColors.red,
                              ),
                              validator: (value) {
                                return value!.length < 6
                                    ? 'Please fill all fields'.tr
                                    : null;
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => GestureDetector(
                                      onTap: controller.isCountdownFinished.value
                                          ? () => controller.handleResend()
                                          : null,
                                      child: Text(
                                        controller.isCountdownFinished.value
                                            ? 'Resend'.tr
                                            : 'Resend in'.tr,
                                        style: globalTextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Obx(
                                    () => controller.isCountdownFinished.value !=
                                            false
                                        ? const SizedBox.shrink()
                                        : Countdown(
                                            seconds: 60,
                                            build: (BuildContext context,
                                                    double time) =>
                                                Text(
                                              time.toStringAsFixed(2),
                                              style: globalTextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            interval: const Duration(
                                                milliseconds: 1000),
                                            onFinished: () {
                                              controller.isCountdownFinished
                                                  .value = true;
                                            },
                                          ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Text(
                                  'Edit number'.tr,
                                  style: globalTextStyle(
                                    fontSize: 14.sp,
                                    color: CustomColors.red,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          text: 'Verify'.tr,
                          textSize: 16.sp,
                          marginTop: Get.height * 0.13,
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              final UserController userController = Get.find();
                              userController.currentUser.value.phoneNo = number;
                              Get.to(() => const UserDetailsScreen());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
