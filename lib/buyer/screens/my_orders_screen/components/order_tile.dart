import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/order_model.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

import '../my_order_details.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.secondary,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 1,
          color: CustomColors.borderColor,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${'Order ID'.tr} ${order.id}',
                style: globalTextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${'Placed'.tr}: ${formatDate(
                  order.placedAt!,
                  [
                    dd,
                    '/',
                    mm,
                    '/',
                    yyyy,
                  ],
                )}',
                style: globalTextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Text(
                '${'Products'.tr} ( ${order.products!.length} )',
                style: globalTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                ListView.builder(
                  itemCount: order.products!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final product = order.products![index];
                    return ListTile(
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          color: CustomColors.secondaryDark,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Image.asset(
                          product.image!,
                          height: 90.h,
                          width: 40.w,
                        ),
                      ),
                      title: Text(
                        product.title!.capitalizeFirst!,
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '${'Quantity'.tr}: 1',
                        style: globalTextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      trailing: Text(
                        '${product.price!.toStringAsFixed(2)} PKR',
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          CustomButton(
            text: 'Details',
            borderColor: CustomColors.borderColor,
            color: CustomColors.secondary,
            textColor: Colors.black87,
            fontWeight: FontWeight.w500,
            textSize: 14.sp,
            onTap: () => Get.to(
              () => MyOrderDetails(
                order: order,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
