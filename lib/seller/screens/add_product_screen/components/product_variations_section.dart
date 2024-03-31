import 'package:get/get.dart';
import 'package:e_shop_ui/seller/controllers/add_product_screen_controller.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../../widgets/custom_button.dart';
import '../../../models/product_variation_model.dart';
import 'product_size_tile.dart';

class ProductVariationsSection extends GetView<AddProductController> {
  final RxBool hasVariations;
  const ProductVariationsSection(this.hasVariations, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'product variation${!hasVariations.value ? '' : 's'}'.tr,
            style: globalTextStyle(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          !hasVariations.value
              ? const ProductSizeTile(
                  index: 0,
                  showLabels: true,
                )
              : Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productVariations.length,
                      itemBuilder: (_, index) {
                        return ProductSizeTile(
                          index: index,
                          showLabels: index == 0 ? true : false,
                        );
                      },
                    ),
                    Obx(
                      () => controller.productVariations.length < 4
                          ? CustomButton(
                              width: Get.width * 0.6,
                              text: 'add variation',
                              marginTop: 16.h,
                              onTap: () {
                                final List<String> selectedSizes = controller
                                    .productVariations
                                    .map((variation) => variation.size)
                                    .toList();

                                controller.updateProductVariations(
                                  ProductVariationModel(
                                    size: controller.sizes.firstWhere((size) =>
                                        !selectedSizes.contains(size)),
                                    stock: 1,
                                    price: 0,
                                  ),
                                );
                              },
                            )
                          : CustomButton(
                              width: Get.width * 0.6,
                              text: 'add variation',
                              color: CustomColors.grayDark.withOpacity(0.2),
                              borderColor:
                                  CustomColors.grayDark.withOpacity(0.2),
                              textColor: CustomColors.secondary,
                              onTap: () {},
                            ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
