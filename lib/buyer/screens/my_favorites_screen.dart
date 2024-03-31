import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/product_tile.dart';

import 'product_details_screen/product_details_screen.dart';

class MyFavoritesScreen extends GetView<HomeController> {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Favorites".tr,
        hasBackButton: true,
      ),
      body: FutureBuilder(
        future: controller.productsFuture.value,
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
          return Obx(
            () => controller.userController.favorites.isEmpty
                ? Center(
                    child: Text(
                      'No Favorites'.tr,
                      style: globalTextStyle(
                        fontSize: 14.sp,
                        color: CustomColors.grayDark,
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.userController.favorites.length,
                    padding: EdgeInsets.all(horizontalPadding),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 40,
                    ),
                    itemBuilder: (context, index) {
                      final product =
                          controller.userController.favorites[index];
                      return ProductTile(
                        product: product,
                        onPressed: () => Get.to(
                          () => ProductDetailsScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
