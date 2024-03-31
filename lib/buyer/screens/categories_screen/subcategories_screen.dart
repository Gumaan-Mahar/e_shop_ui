import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/subcategory_controller.dart';
import 'package:e_shop_ui/buyer/screens/categories_screen/category_item.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';
import 'package:e_shop_ui/widgets/custom_list_tile.dart';

class SubCategoriesScreen extends GetView<SubCategoriesController> {
  final String categoryName;
  final String id;
  const SubCategoriesScreen(
      {required this.categoryName, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SubCategoriesController());
    return Scaffold(
      appBar: CustomAppBar(
        hasBackButton: true,
        title: categoryName.tr,
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //       Get.to(() =>  FilterScreen(name: categoryName, id: id,));
        //     },
        //     icon:const Icon(FlutterRemix.equalizer_line) ),
        // ]
      ),
      body: ListView.builder(
        itemCount: controller.subCategories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomListTile(
                title: controller.subCategories[index].name!.tr,
                hasBackButton: true,
                // trailing: const Icon(FlutterRemix.arrow_right_s_line),
                onTap: () {
                  Get.to(
                    () => CategoryItem(
                      id: 'aa',
                      // id: controller.subCategories[index].id!,
                      name: controller.subCategories[index].name!,
                    ),
                  );
                },
              ),
              const Divider(
                color: Colors.black54,
              ),
            ],
          );
        },
      ),
    );
  }
}
