import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class OtpController extends GetxController {
  final TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isCountdownFinished = false.obs;

  void handleResend() {
    isCountdownFinished.value = false;
  }

  @override
  void onClose() {
    pinController.dispose();
    super.onClose();
  }
}
