import 'dart:io';

import 'package:e_shop_ui/common/controllers/user_details_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/imports/core_imports.dart';
import '../../helpers/reg_expressions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class UserDetailsScreen extends GetView<UserDetailsController> {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserDetailsController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
            top: 60.h,
            bottom: 5.h,
            left: 15.w,
            right: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Get.locale == const Locale('en_US')
                        ? Icon(
                            FlutterRemix.arrow_drop_left_line,
                            size: 20.dg,
                          )
                        : Icon(
                            FlutterRemix.arrow_drop_right_line,
                            size: 20.dg,
                          ),
                    Text(
                      'BACK'.tr,
                      style: globalTextStyle(fontSize: 14.sp),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Enter details'.tr,
                        style: globalTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.primary,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => showImagePicker(context),
                      child: Center(
                        child: Stack(
                          children: [
                            Obx(
                              () => CircleAvatar(
                                radius: 65,
                                backgroundColor: CustomColors.primary,
                                foregroundColor: Colors
                                    .grey, // Background color of the avatar
                                backgroundImage: controller.imagePath!.value !=
                                        ''
                                    ? FileImage(
                                            File(controller.imagePath!.value))
                                        as ImageProvider<Object>
                                    : const AssetImage(
                                        'assets/images/blank_profile_picture.webp',
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IgnorePointer(
                                child: Container(
                                  height: 35,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColors.primaryDark,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      FlutterRemix.edit_line,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Form(
                      key: controller.formKey,
                      child: Column(children: [
                        SizedBox(
                          height: 27.h,
                        ),
                        CustomTextField(
                          controller: controller.nameController,
                          keyboardType: TextInputType.text,
                          hintText: 'Name'.tr,
                          height: 50.h,
                          width: Get.width * 0.9,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name'.tr;
                            } else if (value.length < 3) {
                              return 'Please enter a valid name'.tr;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email'.tr,
                          height: 50.h,
                          width: Get.width * 0.9,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExpressions.emailText,
                            )
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email'.tr;
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid email'.tr;
                            }
                            return null;
                          },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    CustomButton(
                      text: 'continue',
                      textSize: 16.sp,
                      onTap: () async {
                        if (controller.formKey.currentState!.validate()) {
                          if (controller.imagePath!.value.isEmpty) {
                            showToast('Please select image', status: 'info');
                          } else {
                            await controller.handleUpdate(
                              controller.nameController.text.trim(),
                              controller.emailController.text.trim(),
                              controller.pickedFile!,
                            );
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    controller.pickedFile = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from gallery'),
              onTap: () async {
                Navigator.pop(
                  context,
                  await picker.pickImage(source: ImageSource.gallery),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Take a photo'),
              onTap: () async {
                Navigator.pop(
                  context,
                  await picker.pickImage(source: ImageSource.camera),
                );
              },
            ),
          ],
        );
      },
    );
    if (controller.pickedFile != null) {
      controller.imagePath!.value = controller.pickedFile!.path;
    }
  }
}
