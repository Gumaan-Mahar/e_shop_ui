// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

class WishlistButtons extends GetView<WishlistButtons> {
  final double total;

  const WishlistButtons({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 15.h),
      decoration: BoxDecoration(
        color: CustomColors.secondary,
        boxShadow: [
          BoxShadow(
            color: CustomColors.borderColor.withOpacity(0.7),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'ADD TO BAG',
                    textSize: 13.sp,
                    onTap: () {
                      final UserController userController = Get.find();
                      // Insert all wishlist items into cart
                      userController.cart.value.items!.insertAll(
                        0,
                        userController.wishlist.value.items!,
                      );
                      userController.cart.refresh();
                      // Sum of all wishlist items
                      userController.cart.value.total =
                          userController.cart.value.total! +
                              userController.cart.value.items!
                                  .map((e) => e.price! * e.quantity!)
                                  .reduce((a, b) => a + b);
                      userController.cart.refresh();
                      // Clear wishlist
                      userController.wishlist.value.items!.clear();
                      userController.wishlist.refresh();
                      showToast('Added all products into your shopping bag'.tr);
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    '${total.toStringAsFixed(2)} PKR',
                    style: globalTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
