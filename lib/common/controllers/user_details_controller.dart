import 'dart:convert';
import 'dart:io';

import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/imports/core_imports.dart';
import '../screens/start_shopping_screen.dart';

class UserDetailsController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  RxString? imagePath = ''.obs;
  XFile? pickedFile;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  Future<void> handleUpdate(String name, String email, XFile image) async {
    final UserController userController = Get.find();
    final bytes = File(image.path).readAsBytesSync();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
    userController.currentUser.value.name = name;
    userController.currentUser.value.email = email;
    userController.currentUser.value.image = base64Image;
    Get.offAll(() => StartShoppingScreen(name: name));
  }
}
