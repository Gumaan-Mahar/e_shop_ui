import 'dart:io';

import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/add_product_details.dart';

import '../../../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPressed;
  const ProductTile(
      {super.key, required this.product, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: CustomColors.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: CustomColors.secondaryDark,
                  borderRadius: BorderRadius.circular(16.r),
                  image: DecorationImage(
                    image: FileImage(
                      File(product.displayImage!),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              product.name!.capitalizeFirst!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: globalTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 2.h,),
            Text(
              product.description!.capitalizeFirst!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: globalTextStyle(
                fontSize: 10.sp,
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${product.price!.toStringAsFixed(2)} PKR',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: globalTextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                GestureDetector(
                  onTap: () => Get.to(
                    () => AddProductDetials(
                      product: product,
                    ),
                  ),
                  child: Icon(
                    FlutterRemix.edit_box_line,
                    size: 20.h,
                    color: CustomColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
