import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/order_model.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class SummarySection extends StatelessWidget {
  final OrderModel order;

  const SummarySection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          // height: Get.height * 0.3,
          decoration: BoxDecoration(
            color: CustomColors.secondary,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColors.borderColor.withOpacity(0.4),
                blurRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Text(
                        'summary'.tr,
                        style: globalTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
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
                            order.total!.toStringAsFixed(2),
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
                            order.promoCode!.isEmpty
                                ? '-'
                                : order.promoCode!.toUpperCase(),
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
                            '3.00 PKR',
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
                          Text(
                            order.paymentMode!,
                            style: globalTextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                const Divider(
                  color: CustomColors.borderColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 5.h,
                  ),
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
                        '${(order.total! + deliveryCharges).toStringAsFixed(2)} PKR',
                        style: globalTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
