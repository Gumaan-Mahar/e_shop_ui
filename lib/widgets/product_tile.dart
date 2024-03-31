import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPressed;
  const ProductTile({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    final RxBool isFavorite =
        userController.favorites.contains(product).obs;
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            color: CustomColors.secondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    decoration: BoxDecoration(
                      color: CustomColors.secondaryDark,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset(
                      product.image!,
                      fit: BoxFit.contain,
                    ),
                    // child: CachedNetworkImage(
                    //   imageUrl: product.image!,
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  product.title!.capitalizeFirst!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: globalTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  product.description!.capitalizeFirst!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: CustomColors.grayDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
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
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                final HomeController homeController = Get.find();
                homeController.addToFavorites(
                  item: product,
                  isFavorite: isFavorite,
                );
              },
              child: Obx(
                () => Icon(
                  isFavorite.value
                      ? FlutterRemix.heart_3_fill
                      : FlutterRemix.heart_3_line,
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
