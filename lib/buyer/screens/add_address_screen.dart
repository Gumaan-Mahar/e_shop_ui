import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/add_address_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:e_shop_ui/widgets/custom_outlined_textfield.dart';

class AddAddressScreen extends GetView<AddAddressController> {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Add Address".tr,
          hasBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  CustomOutlinedTextField(
                    label: 'Goverorate'.tr,
                    hintText: 'Goverorate'.tr,
                    textEditingController: controller.goverorateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  CustomOutlinedTextField(
                    label: 'Area'.tr,
                    hintText: 'Area'.tr,
                    textEditingController: controller.areaController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomOutlinedTextField(
                          label: 'Block'.tr,
                          hintText: 'Block'.tr,
                          textEditingController: controller.blockController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10.h),
                      Expanded(
                        child: CustomOutlinedTextField(
                          label: 'Street'.tr,
                          hintText: 'Street'.tr,
                          textEditingController: controller.streetController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is required'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomOutlinedTextField(
                    label: 'Avenue'.tr,
                    hintText: 'Avenue'.tr,
                    textEditingController: controller.avenueController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  CustomOutlinedTextField(
                    label: 'Buidling'.tr,
                    hintText: 'Buidling'.tr,
                    textEditingController: controller.buildingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  CustomOutlinedTextField(
                    label: 'Floor'.tr,
                    hintText: 'Floor'.tr,
                    keyboardType: TextInputType.number,
                    textEditingController: controller.floorController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  CustomOutlinedTextField(
                    label: 'Home / Apartment'.tr,
                    hintText: 'Home / Apartment'.tr,
                    textEditingController: controller.apartmentController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              text: 'Add Address'.tr,
              width: Get.width * 0.9,
              marginBottom: 20.h,
              onTap: controller.handleAddAddress,
            ),
          ],
        ),
      ),
    );
  }
}
