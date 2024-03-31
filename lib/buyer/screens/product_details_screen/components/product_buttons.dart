import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/product_details_controller.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';
import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

class ProductButtons extends GetView<ProductDetailsController> {
  final ProductModel product;

  const ProductButtons({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(horizontalPadding),
      decoration: BoxDecoration(
        color: CustomColors.secondary,
        boxShadow: [
          BoxShadow(
            color: CustomColors.borderColor.withOpacity(0.7),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'ADD WISHLIST'.tr,
              textSize: 13.sp,
              color: CustomColors.secondary,
              textColor: CustomColors.primary,
              icon: FlutterRemix.heart_3_line,
              fontWeight: FontWeight.w500,
              onTap: () => controller.addToWishlist(
                CartItemModel(
                  id: product.id,
                  name: product.title,
                  description: product.description,
                  price: product.price,
                  quantity: 1,
                  image: product.image,
                  size: controller.selectedSize.value,
                  color: controller.selectedColor.value,
                  sizes: product.sizes,
                  colors: product.colors,
                ),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: CustomButton(
              text: 'ADD TO BAG'.tr,
              iconColor: CustomColors.secondary,
              icon: FlutterRemix.shopping_bag_3_line,
              fontWeight: FontWeight.w500,
              textSize: 13.sp,
              onTap: () => controller.addToBag(
                CartItemModel(
                  id: product.id,
                  name: product.title,
                  description: product.description,
                  price: product.price,
                  quantity: 1,
                  image: product.image,
                  size: controller.selectedSize.value,
                  color: controller.selectedColor.value,
                  sizes: product.sizes,
                  colors: product.colors,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
