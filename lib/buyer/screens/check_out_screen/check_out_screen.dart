import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/check_out_controller.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';
import 'package:e_shop_ui/buyer/screens/add_address_screen.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/helpers/format_address.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

import 'components/checkout_summary.dart';
import 'components/payment_modes.dart';

class CheckOutScreen extends GetView<CheckoutController> {
  final CartModel cart;

  const CheckOutScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    controller.cart.value = cart;
    final UserController userController = Get.find();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Checkout".tr,
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => userController.currentUser.value.address == null
                    ? Center(
                        child: CustomButton(
                          text: 'Add Address',
                          textSize: 13.sp,
                          width: Get.width * 0.9,
                          marginBottom: 12.h,
                          onTap: () => Get.to(() => const AddAddressScreen()),
                        ),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery Address'.tr,
                              style: globalTextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              formatAddress(
                                  userController.currentUser.value.address!),
                              style: globalTextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            if (userController.currentUser.value.phoneNo !=
                                null)
                              Text(
                                userController.currentUser.value.phoneNo!,
                                style: globalTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                      ),
              ),
              const Divider(
                color: CustomColors.borderColor,
              ),
              CheckoutSummary(
                total: cart.total!,
              ),
              const Divider(
                color: CustomColors.borderColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total'.tr,
                      style: globalTextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${(cart.total! + deliveryCharges).toStringAsFixed(2)} PKR',
                      style: globalTextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: CustomColors.borderColor,
              ),
              const PaymentModes(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            text: 'PAY',
            width: Get.width * 0.9,
            marginBottom: 15.h,
            icon: FlutterRemix.secure_payment_fill,
            iconColor: CustomColors.secondary,
            onTap: () => controller.handlePay(),
          ),
        ],
      ),
    );
  }
}
