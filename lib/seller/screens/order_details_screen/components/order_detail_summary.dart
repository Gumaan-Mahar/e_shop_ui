import 'package:get/get.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../models/order_model.dart';

class OrderDetailSummary extends StatelessWidget {
  final OrderModel order;
  const OrderDetailSummary({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.3,
      padding: EdgeInsets.symmetric(
        vertical: 32.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        color: CustomColors.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30.w,
          ),
          topRight: Radius.circular(
            30.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.shadowColor,
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
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
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'subtotal'.tr,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${order.subTotal.toStringAsFixed(3)} PKR',
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'code applied'.tr,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                order.codeApplied,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'discount'.tr,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${order.discount} %',
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'delivery charges'.tr,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${order.deliveryCharges.toStringAsFixed(3)} PKR',
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'payment mode'.tr,
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: CustomColors.grayDark,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                order.paymentMethod.toString(),
                style: globalTextStyle(
                  fontSize: 12.sp,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
