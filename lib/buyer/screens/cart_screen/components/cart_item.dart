import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';
import 'package:e_shop_ui/buyer/screens/product_details_screen/components/colors_drop_down.dart';
import 'package:e_shop_ui/buyer/screens/product_details_screen/components/sizes_drop_down.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onQuantityIncrement;
  final VoidCallback onQuantityDecrement;
  final Function(String?)? onSizeChange;
  final Function(String?)? onColorChange;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.item,
    required this.onQuantityIncrement,
    required this.onQuantityDecrement,
    required this.onSizeChange,
    required this.onColorChange,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: CustomColors.grayLight.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onRemove,
            child: Icon(
              FlutterRemix.delete_bin_6_line,
              color: CustomColors.red,
              size: 16.h,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.h),
                margin: EdgeInsets.only(
                  right: Get.locale == const Locale('en_US') ? 15.w : 0,
                  left: Get.locale == const Locale('en_US') ? 0 : 15.w,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.secondaryDark,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  item.image!,
                  height: 90.h,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name!.capitalizeFirst!,
                      style: globalTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      item.description!.capitalizeFirst!,
                      style: globalTextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${item.price!.toStringAsFixed(2)} PKR',
                      style: globalTextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Divider(
                      color: CustomColors.borderColor,
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: Get.width * 0.4,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: onQuantityDecrement,
                                  child: Icon(
                                    FlutterRemix.subtract_fill,
                                    size: 16.h,
                                  ),
                                ),
                                Text(
                                  item.quantity.toString(),
                                  style: globalTextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: onQuantityIncrement,
                                  child: Icon(
                                    FlutterRemix.add_fill,
                                    size: 16.h,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: CustomColors.borderColor.withOpacity(0.3),
                              thickness: 1.5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizesDropDown(
                selectedSize: item.size!.obs,
                sizes: item.sizes!,
                onChanged: onSizeChange,
              ),
              SizedBox(width: 30.w),
              ColorsDropDown(
                selectedColor: item.color!.obs,
                colors: item.colors!,
                onChanged: onColorChange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
