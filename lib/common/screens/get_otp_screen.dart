import 'package:e_shop_ui/common/controllers/getotp_controller.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/imports/core_imports.dart';
import '../../widgets/custom_textfield.dart';
import 'otp_screen.dart';

class GetOtpScreen extends GetView<GetOtpController> {
  const GetOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetOtpController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.only(right: 20.w, left: 20.w, top: Get.height * 0.15),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'E-SHOP',
                      style: globalTextStyle(
                        color: CustomColors.primary,
                        fontSize: 33.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                      ),
                      children: [
                        TextSpan(
                          text: ' UI',
                          style: globalTextStyle(
                            color: CustomColors.primary,
                            fontSize: 33.sp,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Style Simplified, Satisfaction Guaranteed'.tr,
                    style: globalTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 41.h, bottom: 13.h),
                  child: Text(
                    'Mobile No'.tr,
                    style: globalTextStyle(
                      fontSize: 14.sp,
                      color: CustomColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 70.h,
                      decoration: BoxDecoration(
                        color: CustomColors.gray,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          '+92',
                          style: globalTextStyle(
                            fontSize: 14.sp,
                            color: CustomColors.grayDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: controller.number,
                        keyboardType: TextInputType.number,
                        hintText: 'enter your phone number'.tr,
                        height: 50.h,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your number'.tr;
                          } else if (value.length < 10) {
                            return 'number must be at least 10 characters'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10.h, bottom: Get.height * 0.13),
                  child: Text(
                    'One time password will be send to this number'.tr,
                    style: globalTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomButton(
                  text: 'GET OTP'.tr,
                  textSize: 16.sp,
                  onTap: () => {
                    if (controller.formKey.currentState!.validate())
                      {
                        Get.to(
                          () => OtpScreen(
                            number: controller.number.text,
                          ),
                        ),
                      }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
