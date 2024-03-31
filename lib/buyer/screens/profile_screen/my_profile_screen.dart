import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/myprofile_controller.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:e_shop_ui/widgets/custom_outlined_textfield.dart';

class MyProfileScreen extends GetView<MyProfileController> {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put( MyProfileController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'My Profile',
        hasBackButton: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding + 20.h),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomOutlinedTextField(
                    hintText: '',
                    textEditingController: controller.name,
                    label: 'Name',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.length < 3) {
                        return 'Please Enter a Valid Name';
                      }
                      return null;
                    }),
                CustomOutlinedTextField(
                    hintText: '',
                    textEditingController: controller.mobileno,
                    label: 'Mobile Number',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Please Enter a Valid Number';
                      }
                      return null;
                    }),
                CustomOutlinedTextField(
                  hintText: '',
                  textEditingController: controller.email,
                  label: 'Email Address',
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (!GetUtils.isEmail(value!)) {
                      return 'Please Enter a Valid Email';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                CustomButton(
                  width: Get.width * 0.7,
                  text: 'Update',
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      final UserController userController = Get.find();
                      userController.currentUser.update((user) {
                        user!.name = controller.name.text.trim();
                        user.email = controller.email.text.trim();
                        user.phoneNo = controller.mobileno.text.trim();
                      });
                      // ignore: invalid_use_of_protected_member
                      userController.currentUser.refresh();
                      Get.back();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
