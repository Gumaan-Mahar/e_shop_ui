import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/buyer/screens/bottom_nav_screen.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/may_like_products.dart';

import '../../controllers/product_details_controller.dart';
import 'components/colors_drop_down.dart';
import 'components/product_buttons.dart';
import 'components/product_images.dart';
import 'components/product_reviews.dart';
import 'components/sizes_drop_down.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    controller.selectedColor.value = product.colors![0];
    final UserController userController = Get.find();
    final RxBool isFavorite =
        userController.favorites.contains(product).obs;

    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        elevation: 0,
        color: CustomColors.secondaryDark,
        hasBackButton: true,
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              final HomeController homeController = Get.find();
              homeController.addToFavorites(
                item: product,
                isFavorite: isFavorite,
              );
            },
            icon: Obx(
              () => Icon(
                isFavorite.value
                    ? FlutterRemix.heart_3_fill
                    : FlutterRemix.heart_3_line,
                color: CustomColors.primary,
                size: 22.h,
              ),
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              final CustomNavController customNavController = Get.find();
              customNavController.selectedTab(3);
              Get.to(() => const BottomNavScreenBuyer());
            },
            icon: Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                Icon(
                  FlutterRemix.shopping_bag_2_line,
                  color: CustomColors.primary,
                  size: 22.h,
                ),
                Positioned(
                  top: 11.h,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: CustomColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Obx(
                      () => Text(
                        Get.find<UserController>()
                            .cart
                            .value
                            .items!
                            .length
                            .toString(),
                        style: globalTextStyle(
                          fontSize: 8.sp,
                          color: CustomColors.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImages(product: product),
            SizedBox(height: 40.h),
            const Divider(
              color: CustomColors.borderColor,
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.toString().capitalizeFirst!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          product.description.toString().capitalizeFirst!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${product.price!.toStringAsFixed(2)} PKR',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: globalTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            const Divider(
              color: CustomColors.borderColor,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  SizesDropDown(
                    selectedSize: controller.selectedSize,
                    sizes: product.sizes!,
                  ),
                  SizedBox(width: 30.w),
                  ColorsDropDown(
                    selectedColor: controller.selectedColor,
                    colors: product.colors!,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description'.tr,
                    style: globalTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    product.description.toString(),
                    style: globalTextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const Divider(
              color: CustomColors.borderColor,
            ),
            const ProductReviews(),
            const Divider(
              color: CustomColors.borderColor,
            ),
            const MayLikeProducts(
              navigateToProductDetails: false,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: ProductButtons(
        product: product,
      ),
    );
  }
}
