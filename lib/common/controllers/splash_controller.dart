import 'dart:async';

import 'package:get/get.dart';
import 'package:e_shop_ui/common/screens/lets_explore_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    Get.to(() => const LetsExploreScreen());

    super.onInit();
  }
}
