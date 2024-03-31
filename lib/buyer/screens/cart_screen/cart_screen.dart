import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/cart_controller.dart';
import 'package:e_shop_ui/buyer/screens/cart_screen/components/cart_item.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/may_like_products.dart';

import 'components/cart_buttons.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondary,
        elevation: 1,
        leadingWidth: Get.width,
        shadowColor: Colors.black,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Shopping Bag'.tr,
                    style: globalTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Obx(
                    () => Text(
                      ' (${userController.cart.value.items!.length})',
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
      ),
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Obx(
                  () => userController.cart.value.items!.isEmpty
                      ? Center(
                          heightFactor: 8.h,
                          child: Text(
                            'Your shopping bag is empty'.tr,
                            style: globalTextStyle(
                              fontSize: 14.sp,
                              color: CustomColors.grayDark,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: userController.cart.value.items!.length,
                          padding: EdgeInsets.only(top: 15.h),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final item =
                                userController.cart.value.items![index];
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
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => userController.cart.value.items!.isEmpty
            ? const SizedBox()
            : CartButtons(
                total: userController.cart.value.total!,
              ),
      ),
    );
  }
}
