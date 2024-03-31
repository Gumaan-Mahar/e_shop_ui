import 'package:e_shop_ui/common/controllers/splash_controller.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../core/imports/core_imports.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    Get.put(UserController(), permanent: true);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.secondary,
              CustomColors.primaryLight.withOpacity(0.7),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                Container(
                  width: Get.width * 0.7,
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
                  alignment: Alignment.center,
                  color: CustomColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'E-SHOP',
                        style: globalTextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'UI',
                        style: globalTextStyle(
                          fontSize: 45.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: Get.height * 0.3,
                    width: Get.width * 0.7,
                    color: CustomColors.primary,
                    padding: EdgeInsets.only(top: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'EVERYTHING FROM',
                          style: globalTextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'E-SHOP UI',
                          style: globalTextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
