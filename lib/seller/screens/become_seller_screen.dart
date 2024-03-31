import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:e_shop_ui/widgets/custom_outlined_textfield.dart';

import '../controllers/become_seller_controller.dart';

class BecomeSellerScreen extends GetView<BecomeSellerController> {
  final VoidCallback navigateTo;

  const BecomeSellerScreen({super.key, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    Get.put(BecomeSellerController());
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Become a Seller".tr,
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
                    label: 'Business Name'.tr,
                    hintText: 'Business Name'.tr,
                    textEditingController: controller.nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  Text(
                    'Business Category'.tr,
                    textAlign: TextAlign.start,
                    style: globalTextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: 44.h,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.w,
                      ),
                      border: Border.all(color: CustomColors.grayDark),
                    ),
                    child: Obx(
                      () => DropdownButton<dynamic>(
                        isExpanded: true,
                        style: globalTextStyle(
                          fontSize: 16.sp,
                        ),
                        value: controller.selectedCategory.value,
                        items: [
                          'T-shirts',
                          'Pants',
                          'Shoes',
                          'Suits',
                          'Dresses',
                          'Jackets',
                          'Hoodies',
                        ]
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item.toString().tr,
                                  style: globalTextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (newVal) {
                          controller.selectedCategory.value =
                              newVal!.toString();
                        },
                        underline: const SizedBox.shrink(),
                        icon: Icon(
                          FlutterRemix.arrow_drop_down_line,
                          size: 28.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomOutlinedTextField(
                    label: 'Expected Number of Products'.tr,
                    hintText: '0'.tr,
                    textEditingController: controller.productsController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  CustomOutlinedTextField(
                    label: 'Shop Address'.tr,
                    hintText: 'Shop Address'.tr,
                    textEditingController: controller.addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  CustomOutlinedTextField(
                    label: 'Mobile Number'.tr,
                    hintText: 'Mobile Number'.tr,
                    textEditingController: controller.phoneNoController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is required'.tr;
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.acceeptedTerms.value,
                          onChanged: (value) =>
                              controller.acceeptedTerms.value = value!,
                        ),
                      ),
                      Text(
                        'accept terms and conditions'.tr,
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
              text: 'Save'.tr,
              width: Get.width * 0.9,
              marginBottom: 20.h,
              onTap: () => controller.handleSave(navigateTo: navigateTo),
            ),
          ],
        ),
      ),
    );
  }
}
