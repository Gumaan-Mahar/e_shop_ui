import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/cart_controller.dart';
import 'package:e_shop_ui/buyer/controllers/check_out_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class CheckoutSummary extends GetView<CheckoutController> {
  final double total;

  const CheckoutSummary({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'summary'.tr,
            style: globalTextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal'.tr,
                style: globalTextStyle(
                  fontSize: 13.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                total.toStringAsFixed(2),
                style: globalTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Code Applied'.tr,
                style: globalTextStyle(
                  fontSize: 13.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                cartController.promoCodeController.text.isEmpty
                    ? '-'
                    : cartController.promoCodeController.text
                        .trim()
                        .toUpperCase(),
                style: globalTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount'.tr,
                style: globalTextStyle(
                  fontSize: 13.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '0%',
                style: globalTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charges'.tr,
                style: globalTextStyle(
                  fontSize: 13.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${deliveryCharges.toStringAsFixed(2)} PKR',
                style: globalTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Mode'.tr,
                style: globalTextStyle(
                  fontSize: 13.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Obx(
                () => Text(
                  controller.paymentMode.value,
                  style: globalTextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
