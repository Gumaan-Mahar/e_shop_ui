// ignore_for_file: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/product_details_controller.dart';
import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class ProductImages extends GetView<ProductDetailsController> {
  final ProductModel product;

  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.height * 0.3,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 45.h),
          decoration: BoxDecoration(
            color: CustomColors.secondaryDark,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
          ),
          child: Obx(
            () => Image.asset(
              controller.selectedImage.value == 100
                  ? product.image!
                  : product.images![controller.selectedImage.value],
            ),
          ),
        ),
        Positioned(
          bottom: -25,
          child: Row(
            children: product.images!.mapIndexed(
              (index, e) {
                return GestureDetector(
                  onTap: () => controller.selectedImage(index),
                  child: Obx(
                    () => Container(
                      height: 50.h,
                      width: 50.w,
                      padding: const EdgeInsets.all(4),
                      margin: EdgeInsets.only(right: 15.w),
                      decoration: BoxDecoration(
                        color: CustomColors.grayDark,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          width: 2,
                          color: controller.selectedImage.value == index
                              ? CustomColors.primary
                              : CustomColors.grayDark,
                        ),
                      ),
                      child: Image.asset(e),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
