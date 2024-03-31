// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:e_shop_ui/helpers/generate_random_id.dart';
import 'package:e_shop_ui/seller/controllers/add_product_screen_controller.dart';
import 'package:e_shop_ui/seller/models/product_model.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/components/product_variations_section.dart';

import '../../../core/imports/core_imports.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_button.dart';
import 'components/product_colors_section.dart';

class AddProductOptions extends GetView<AddProductController> {
  const AddProductOptions({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
    final RxBool hasVariations =
        controller.productType.value == 'One' ? false.obs : true.obs;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: controller.editingProduct.value.id != null
              ? 'edit product'
              : 'add product',
          hasBackButton: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'product option'.tr,
                            style: globalTextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomButton(
                                  width: Get.width * 0.4,
                                  text: 'one type',
                                  textSize: 15.sp,
                                  color: !hasVariations.value
                                      ? CustomColors.primary
                                      : CustomColors.secondary,
                                  textColor: !hasVariations.value
                                      ? CustomColors.secondary
                                      : CustomColors.primary,
                                  onTap: () => {
                                    controller.productType.value = 'One',
                                    hasVariations.value = false,
                                  },
                                ),
                                CustomButton(
                                  width: Get.width * 0.4,
                                  text: 'combination',
                                  textSize: 15.sp,
                                  color: hasVariations.value
                                      ? CustomColors.primary
                                      : CustomColors.secondary,
                                  textColor: hasVariations.value
                                      ? CustomColors.secondary
                                      : CustomColors.primary,
                                  onTap: () => {
                                    controller.productType.value =
                                        'Combination',
                                    hasVariations.value = true,
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const ProductColorsSection(),
                      SizedBox(
                        height: 8.h,
                      ),
                      ProductVariationsSection(hasVariations),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
              ),
              child: Center(
                child: CustomButton(
                  width: Get.width * 0.6,
                  text: 'save & continue',
                  textSize: 14.sp,
                  marginBottom: 10.h,
                  onTap: () => {
                    if (controller.productVariations
                        .where((variation) =>
                            variation.stock <= 0 || variation.price <= 0.00)
                        .isEmpty)
                      {
                        controller.handleAddProduct(
                          ProductModel(
                            id: controller.editingProduct.value.id ?? generateID(),
                            name: controller.nameController.text.trim(),
                            arName: controller.arNameController.text.trim(),
                            description:
                                controller.descriptionController.text.trim(),
                            arDescription:
                                controller.arDescriptionController.text.trim(),
                            displayImage:
                                controller.selectedDisplayImage.value.path,
                            images: controller.selectedProductImages.value
                                .map((e) => e.path)
                                .toList(),
                            colors: controller.colors.value,
                            variations: controller.productVariations.value,
                            price: double.parse(
                                controller.priceController.text.trim()),
                            noOfStocks: int.parse(
                                controller.noOfStockController.text.trim()),
                          ),
                        ),
                      }
                    else
                      {
                        showToast(
                          'enter valid stock and price values'.tr,
                          status: 'info',
                        ),
                      }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
