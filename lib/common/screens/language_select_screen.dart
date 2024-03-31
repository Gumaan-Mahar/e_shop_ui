import 'package:e_shop_ui/common/screens/get_otp_screen.dart';
import 'package:get/get.dart';

import '../../core/imports/core_imports.dart';
import '../../widgets/custom_button.dart';

class LanguageSelectScreen extends StatelessWidget {
  const LanguageSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/explore.png',
            fit: BoxFit.contain,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '${'Your style'.tr} \n',
                    style: globalTextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Your Language'.tr,
                        style: globalTextStyle(
                          fontSize: 36.sp,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.1),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: Get.height * 0.13),
                  child: Column(
                    children: [
                      CustomButton(
                        height: 45.h,
                        text: 'English',
                        color: Colors.transparent,
                        textColor: Colors.white,
                        borderRadius: 10,
                        textSize: 18.sp,
                        width: Get.width * 0.85,
                        borderColor: Colors.white,
                        onTap: () async {
                          await Get.updateLocale(const Locale('en_US'));
                          Get.offAll(() => const GetOtpScreen());
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                        height: 45.h,
                        text: 'Urdu',
                        textSize: 18.sp,
                        color: Colors.transparent,
                        textColor: Colors.white,
                        borderRadius: 10,
                        width: Get.width * 0.85,
                        borderColor: Colors.white,
                        onTap: () async {
                          await Get.updateLocale(const Locale('ur'));
                          Get.offAll(() => const GetOtpScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
