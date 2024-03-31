import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class FeedbackController extends GetxController{
   final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileno = TextEditingController();
  final TextEditingController issues = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserController userController = Get.find();

  @override
  void onInit() {
    name.text = userController.currentUser.value.name!.capitalizeFirst!;
    email.text = userController.currentUser.value.email!.capitalizeFirst!;
    mobileno.text = userController.currentUser.value.phoneNo!;
    super.onInit();
  }
  @override
  void onClose() {
    name.dispose();
    email.dispose();
    issues.dispose();
    mobileno.dispose();
    super.onClose();
  }

}