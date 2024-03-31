import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/cart_controller.dart';
import 'package:e_shop_ui/buyer/screens/check_out_screen/check_out_screen.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:e_shop_ui/widgets/custom_outlined_textfield.dart';

class CartButtons extends GetView<CartController> {
  final double total;

  const CartButtons({super.key, required this.total});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedTextField(
                  hintText: 'Enter promo code',
                  textEditingController: controller.promoCodeController,
                  validator: (value) {
                    return null;
                  },
                ),
              ),
              SizedBox(width: 12.w),
              CustomButton(
                text: 'Apply',
                width: Get.width * 0.25,
                textSize: 13.sp,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Checkout'.tr.toUpperCase(),
                    textSize: 13.sp,
                    onTap: () => Get.to(
                      () => CheckOutScreen(
                        cart: controller.userController.cart.value,
                      ),
                    ),
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
