import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/buyer/screens/product_details_screen/product_details_screen.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/product_tile.dart';

class NewInProducts extends GetView<HomeController> {
  const NewInProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'new in'.tr,
          style: globalTextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        FutureBuilder(
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
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
              ),
              itemBuilder: (context, index) {
                final product = controller.products[index];
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
      ],
    );
  }
}
