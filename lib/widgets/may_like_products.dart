import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/buyer/screens/product_details_screen/product_details_screen.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

class MayLikeProducts extends StatelessWidget {
  final bool navigateToProductDetails;

  const MayLikeProducts({super.key, required this.navigateToProductDetails});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(horizontalPadding),
          child: Text(
            'you may also like'.tr,
            style: globalTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        FutureBuilder(
          future: homeController.productsFuture.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                heightFactor: 10.h,
                child: Text(
                  'failed to load'.tr,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: CustomColors.grayDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }

            // final List<ProductModel> products = List<ProductModel>.from(
            //   snapshot.data!.map(
            //     (x) => x as ProductModel,
            //   ),
            // );
            return SizedBox(
              height: Get.height * 0.4,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.products.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemBuilder: (context, index) {
                  final RxBool isFavorite = false.obs;
                  final product = homeController.products[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: !navigateToProductDetails
                            ? () {}
                            : () => Get.to(
                                  () => ProductDetailsScreen(product: product),
                                ),
                        child: Container(
                          width: Get.width * 0.5,
                          color: CustomColors.secondary,
                          margin: EdgeInsets.only(
                            right: Get.locale == const Locale('ur')
                                ? 0
                                : index == homeController.products.length - 1
                                    ? 0
                                    : 6.w,
                            left: Get.locale == const Locale('ur')
                                ? 10
                                : index == homeController.products.length - 1
                                    ? 0
                                    : 6.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: Get.width * 0.5,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  decoration: BoxDecoration(
                                    color: CustomColors.secondaryDark,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Image.asset(
                                    product.image!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                product.title!.capitalizeFirst!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: globalTextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                product.description!.capitalizeFirst!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: globalTextStyle(
                                  fontSize: 10.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                '${product.price!.toStringAsFixed(2)} PKR',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: globalTextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 20,
                        child: GestureDetector(
                          onTap: () => isFavorite.value = !isFavorite.value,
                          child: Obx(
                            () => Icon(
                              isFavorite.value
                                  ? FlutterRemix.heart_3_fill
                                  : FlutterRemix.heart_3_line,
                              size: 18.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
