
import 'package:get/get.dart';
import 'package:e_shop_ui/seller/controllers/add_product_screen_controller.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/components/sizes_drop_down.dart';

import '../../../../core/imports/core_imports.dart';
import 'variation_text_field.dart';

class ProductSizeTile extends GetView<AddProductController> {
  final int index;
  final bool showLabels;
  const ProductSizeTile({
    super.key,
    required this.index,
    this.showLabels = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showLabels
                  ? Text(
                      'Size'.tr,
                      style: globalTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.primary,
                      ),
                    )
                  : const SizedBox.shrink(),
              showLabels
                  ? SizedBox(
                      height: 5.h,
                    )
                  : const SizedBox.shrink(),
              Obx(
                () => SizesDropdownButton(
                  width: Get.width * 0.25,
                  value: controller.productVariations[index].size.obs,
                  items: controller.sizes,
                  excludeValues: controller.productVariations
                      .where((variation) =>
                          variation != controller.productVariations[index])
                      .map((variation) => variation.size)
                      .toList(),
                  onChanged: (value) {
                    final variationToUpdate =
                        controller.productVariations[index];
                    variationToUpdate.size = value;
                    controller.productVariations[index] = variationToUpdate;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            width: 32.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showLabels
                    ? Text(
                        'stock'.tr,
                        style: globalTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.primary,
                        ),
                      )
                    : const SizedBox.shrink(),
                showLabels
                    ? SizedBox(
                        height: 5.h,
                      )
                    : const SizedBox.shrink(),
                VariationTextField(
                  initialValue: controller.editingProduct.value.id != null
                      ? controller.productVariations[index].stock.toString()
                      : null,
                  hintText: '1',
                  onChanged: (value) {
                    if (int.tryParse(value) != null) {
                      final variationToUpdate =
                          controller.productVariations[index];
                      variationToUpdate.stock = int.parse(value);
                      controller.productVariations[index] = variationToUpdate;
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: 32.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showLabels
                    ? Text(
                        'price'.tr,
                        style: globalTextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.primary,
                        ),
                      )
                    : const SizedBox.shrink(),
                showLabels
                    ? SizedBox(
                        height: 5.h,
                      )
                    : const SizedBox.shrink(),
                VariationTextField(
                  initialValue: controller.editingProduct.value.id != null
                      ? controller.productVariations[index].price
                          .toStringAsFixed(2)
                      : null,
                  onChanged: (value) {
                    if (double.tryParse(value) != null) {
                      final variationToUpdate =
                          controller.productVariations[index];
                      variationToUpdate.price = double.parse(value);
                      controller.productVariations[index] = variationToUpdate;
                    }
                  },
                  hintText: '0.00',
                ),
              ],
            ),
          ),
          Obx(
            () => controller.productType.value == 'One' ||
                    controller.productVariations.length == 1
                ? const SizedBox.shrink()
                : GestureDetector(
                    onTap: () => controller.productVariations.removeAt(index),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Get.locale == const Locale('en_US') ? 8.w : 0,
                          right:
                              !(Get.locale == const Locale('en_US')) ? 8.w : 0,
                          top: showLabels ? 20.h : 0),
                      child: Icon(
                        Icons.delete,
                        size: 18.h,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
