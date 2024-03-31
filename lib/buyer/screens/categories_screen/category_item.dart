import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/categoryitem_controller.dart';
import 'package:e_shop_ui/buyer/screens/filter_screen/filter_screen.dart';
import 'package:e_shop_ui/buyer/screens/product_details_screen/product_details_screen.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/product_tile.dart';

class CategoryItem extends GetView<CategoryItemController> {
  final String id;
  final String name;
  const CategoryItem({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryItemController());
    return Scaffold(
      appBar: CustomAppBar(
        title: name,
        subTitle: '${controller.products.length} Items',
        hasBackButton: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => FilterScreen(
                  name: name,
                  id: 'abc',
                ),
              );
            },
            icon: const Icon(FlutterRemix.equalizer_line),
            iconSize: 18.h,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        physics: const AlwaysScrollableScrollPhysics(),
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
      ),
    );
  }
}
