import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/feedback_controller.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

import '../../../core/imports/core_imports.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_outlined_textfield.dart';

class FeedbackScreen extends GetView<FeedbackController> {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FeedbackController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Feedback / Issue',
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
                    //  initalValue:  userController.currentUser.value.name!,
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
                    //  initalValue:  userController.currentUser.value.name!,
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
                    //  initalValue:  userController.currentUser.value.name!,
                    textEditingController: controller.email,
                    label: 'Email Address',
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (!GetUtils.isEmail(value!)) {
                        return 'Please Enter a Valid Email';
                      }
                      return null;
                    }),
                CustomOutlinedTextField(
                    hintText: 'Type Here',
                    maxlines: 4,
                    textEditingController: controller.issues,
                    label: 'Feedback/Issues',
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your issue';
                      }
                      return null;
                    }),
                const Spacer(),
                CustomButton(
                  width: Get.width * 0.7,
                  text: 'Submit',
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
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
