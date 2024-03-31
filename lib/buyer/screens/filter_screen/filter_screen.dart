import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/screens/categories_screen/category_item.dart';
import 'package:e_shop_ui/buyer/screens/filter_screen/filter_details.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_top_bar.dart';

class FilterScreen extends StatelessWidget {
  final String name;
  final String id;
  const FilterScreen({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        title: 'Filter',
        action: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              FlutterRemix.close_line,
              color: CustomColors.primaryDark,
              size: 19.dg,
            )),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Size'.tr,
              style: globalTextStyle(fontSize: 14.sp),
            ),
            trailing: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
            ),
            onTap: () {
              Get.to(() => const FilterDetailScreen(title: 'Size'));
            },
          ),
          const Divider(
            color: CustomColors.primaryDark,
          ),
          ListTile(
            title: Text(
              'Color'.tr,
              style: globalTextStyle(fontSize: 14.sp),
            ),
            trailing: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
            ),
            onTap: () {
              Get.to(() => const FilterDetailScreen(title: 'Color'));
            },
          ),
          const Divider(
            color: CustomColors.primaryDark,
          ),
          ListTile(
            title: Text(
              'Brand'.tr,
              style: globalTextStyle(fontSize: 14.sp),
            ),
            trailing: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
            ),
            onTap: () {
              Get.to(() => const FilterDetailScreen(title: 'Brand'));
            },
          ),
          const Divider(
            color: CustomColors.primaryDark,
          ),
          ListTile(
            title: Text(
              'Price'.tr,
              style: globalTextStyle(fontSize: 14.sp),
            ),
            trailing: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
            ),
            onTap: () {
              Get.to(() => const FilterDetailScreen(title: 'Price'));
            },
          ),
          const Divider(
            color: CustomColors.primaryDark,
          ),
          ListTile(
            title: Text(
              'Product Type'.tr,
              style: globalTextStyle(fontSize: 14.sp),
            ),
            trailing: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
            ),
            onTap: () {
              Get.to(() => const FilterDetailScreen(title: 'Product Type'));
            },
          ),
          const Divider(
            color: CustomColors.primaryDark,
          ),
          ListTile(
            title: Text(
              'Discount'.tr,
              style: globalTextStyle(fontSize: 14.sp),
            ),
            trailing: Icon(
              Get.locale == const Locale('en_US')
                  ? FlutterRemix.arrow_right_s_line
                  : FlutterRemix.arrow_left_s_line,
            ),
            onTap: () {
              Get.to(() => const FilterDetailScreen(title: 'Discount'));
            },
          ),
          const Divider(
            color: CustomColors.primaryDark,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => CategoryItem(
              id: id,

              // id: controller.subCategories[index].id!,
              name: name,
            ),
          );
        },
        child: const Icon(
          FlutterRemix.check_fill,
        ),
      ),
    );
  }
}
