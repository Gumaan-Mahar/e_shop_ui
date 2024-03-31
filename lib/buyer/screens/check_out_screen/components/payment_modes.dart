import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/check_out_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class PaymentModes extends GetView<CheckoutController> {
  const PaymentModes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please confirm and submit your order'.tr,
            style: globalTextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "By clicking submit order, you agree to The Yard's Terms of Use and Privacy Policy"
                .tr,
            style: globalTextStyle(fontSize: 11.sp),
          ),
          SizedBox(height: 20.h),
          Text(
            "Payment Mode".tr,
            style: globalTextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: Get.height * 0.3,
            child: ListView.builder(
              itemCount: controller.paymentModes.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final mode = controller.paymentModes[index];
                return Obx(
                  () => Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      color: CustomColors.secondary,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        width: 1,
                        color: mode['name'] == controller.paymentMode.value
                            ? CustomColors.primary
                            : CustomColors.secondaryDark,
                      ),
                      boxShadow: mode['name'] == controller.paymentMode.value
                          ? [
                              BoxShadow(
                                color:
                                    CustomColors.borderColor.withOpacity(0.5),
                                blurRadius: 5,
                              ),
                            ]
                          : null,
                    ),
                    child: ListTile(
                      title: Text(
                        mode['name'],
                        style: globalTextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                      trailing: Image.asset(
                        mode['icon'],
                        height: index == 0
                            ? 16.h
                            : index == 1
                                ? 21.h
                                : 26.h,
                      ),
                      onTap: () {
                        controller.paymentMode.value = mode['name'];
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
