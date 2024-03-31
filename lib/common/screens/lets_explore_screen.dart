import 'package:e_shop_ui/common/screens/language_select_screen.dart';
import 'package:get/get.dart';

import '../../core/imports/core_imports.dart';
import '../../widgets/custom_button.dart';

class LetsExploreScreen extends StatelessWidget {
  const LetsExploreScreen({super.key});

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
              color: Colors.black.withOpacity(
                0.4,
              ),
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
                    text: '${'your style'.tr} \n',
                    style: globalTextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'our curation'.tr,
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
              SizedBox(height: Get.height * 0.17),
              Center(
                child: CustomButton(
                  text: 'lets explore',
                  color: Colors.transparent,
                  textColor: Colors.white,
                  borderRadius: 10,
                  textSize: 16.sp,
                  height: 40.h,
                  width: Get.width * 0.85,
                  fontWeight: FontWeight.w600,
                  borderColor: Colors.white30,
                  marginBottom: Get.height * 0.15,
                  onTap: () {
                    Get.offAll(() => const LanguageSelectScreen());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
