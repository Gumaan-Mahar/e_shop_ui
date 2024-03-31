import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/buyer/controllers/search_controller.dart' as search;
import 'package:e_shop_ui/buyer/screens/product_details_screen/product_details_screen.dart';
import 'package:e_shop_ui/buyer/services/product_services.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/product_tile.dart';

class SearchResultsScreen extends GetView<search.SearchController> {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.searchFuture.value = ProductServices.getProducts(limit: 8);
    final HomeController homeController = Get.find();

    return Scaffold(
      appBar: CustomAppBar(
        title: controller.queryController.text.capitalizeFirst!,
        subTitle: '${controller.resultsCount.value} ${'items'.tr}',
        hasBackButton: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              margin: EdgeInsets.only(
                  right:
                      Get.locale == const Locale('ur') ? 0 : horizontalPadding,
                  left:
                      Get.locale == const Locale('ur') ? horizontalPadding : 0,
                  top: 5,
                  bottom: 5),
              decoration: BoxDecoration(
                color: CustomColors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                FlutterRemix.search_line,
                color: CustomColors.secondary,
                size: 18.w,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(horizontalPadding),
        child: FutureBuilder(
          future: controller.searchFuture.value,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
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
            controller.resultsCount(homeController.products.length);
            return GridView.builder(
              shrinkWrap: true,
              itemCount: homeController.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                final product = homeController.products[index];
                return ProductTile(
                  product: product,
                  onPressed: () => Get.to(
                    () => ProductDetailsScreen(
                      product: product,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
