import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/wishlist_controller.dart';
import 'package:e_shop_ui/buyer/screens/cart_screen/components/cart_item.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/may_like_products.dart';

import 'components/wishlist_buttons.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WishlistController());
    UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondary,
        elevation: 1,
        leadingWidth: Get.width,
        shadowColor: Colors.black,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Get.locale == const Locale('ur')
                        ? FlutterRemix.arrow_right_s_line
                        : FlutterRemix.arrow_left_s_line,
                    color: Colors.black54,
                    size: 24.h,
                  ),
                  onPressed: () => Get.back(),
                ),
                Text(
                  'Wishlist'.tr,
                  style: globalTextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Obx(
                  () => Text(
                    ' (${userController.wishlist.value.items!.length})',
                    style: globalTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Obx(
                  () => userController.wishlist.value.items!.isEmpty
                      ? Center(
                          heightFactor: 8.h,
                          child: Text(
                            'Your wishlist is empty'.tr,
                            style: globalTextStyle(
                              fontSize: 14.sp,
                              color: CustomColors.grayDark,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              userController.wishlist.value.items!.length,
                          padding: EdgeInsets.only(top: 15.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final item =
                                userController.wishlist.value.items![index];
                            return CartItem(
                              item: item,
                              onQuantityIncrement: () =>
                                  controller.incrementQuantity(index, item),
                              onQuantityDecrement: () =>
                                  controller.decrementQuantity(index, item),
                              onRemove: () => controller.removeItem(item),
                              onSizeChange: (value) => controller.changeSize(
                                index,
                                value!,
                              ),
                              onColorChange: (value) => controller.changeColor(
                                index,
                                value!,
                              ),
                            );
                          },
                        ),
                ),
                const MayLikeProducts(
                  navigateToProductDetails: true,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => userController.wishlist.value.items!.isEmpty
            ? const SizedBox()
            : WishlistButtons(
                total: userController.wishlist.value.total!,
              ),
      ),
    );
  }
}
