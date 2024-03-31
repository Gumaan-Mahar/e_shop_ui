import 'package:get/get.dart';
import 'package:e_shop_ui/seller/controllers/home_screen_controller.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/add_product_details.dart';
import 'package:e_shop_ui/seller/screens/home_screen/components/bottom_sheet_list_tile.dart';
import 'package:e_shop_ui/seller/screens/home_screen/components/product_disable_switch.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../../core/imports/packages_imports.dart';
import '../../../models/product_model.dart';

class ProductBottomSheet extends GetView<HomeScreenController> {
  final ProductModel product;
  const ProductBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.36,
      decoration: BoxDecoration(
        color: CustomColors.secondaryDark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            30.w,
          ),
          topRight: Radius.circular(
            30.w,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 22.h,
          ),
          BottomSheetListTile(
            title: 'edit product',
            suffix: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
              size: 28.w,
              color: CustomColors.grayDark,
            ),
            onPressed: () {
              Navigator.pop(context);
              Get.to(
                () => AddProductDetials(
                  product: product,
                ),
              );
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          BottomSheetListTile(
            title: 'make in disable',
            suffix: ProductDisableSwitch(),
            onPressed: () {},
          ),
          SizedBox(
            height: 16.h,
          ),
          BottomSheetListTile(
            title: 'manage stock',
            suffix: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
              size: 28.w,
              color: CustomColors.grayDark,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          BottomSheetListTile(
            title: 'delete product',
            suffix: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
              size: 28.w,
              color: CustomColors.grayDark,
            ),
            onPressed: () {
              showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'confirm delete'.tr,
                      style: globalTextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    content: Text(
                      'are you sure you want to delete this product?'.tr,
                      style: globalTextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          'cancel'.tr,
                          style: globalTextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          controller.products.remove(product);
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          'delete'.tr,
                          style: globalTextStyle(
                            fontSize: 14.sp,
                            color: CustomColors.red,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
    );
  }
}
