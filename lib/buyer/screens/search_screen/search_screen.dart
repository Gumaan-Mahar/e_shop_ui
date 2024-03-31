import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/search_controller.dart' as search;
import 'package:e_shop_ui/buyer/screens/search_screen/search_results_screen.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

class SearchScreen extends GetView<search.SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(search.SearchController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  FlutterRemix.close_line,
                  size: 32.h,
                  color: CustomColors.grayDark,
                ),
              ),
            ),
            TextField(
              controller: controller.queryController,
              textAlign: TextAlign.center,
              autofocus: true,
              style: globalTextStyle(
                fontSize: 24.sp,
                color: CustomColors.primaryDark,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: 'search'.tr,
                hintStyle: globalTextStyle(
                  fontSize: 24.sp,
                  color: CustomColors.primaryDark.withOpacity(0.5),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(
                    color: CustomColors.primary,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(
                    color: CustomColors.primary,
                  ),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(
                    color: CustomColors.primary,
                  ),
                ),
              ),
            ),
            CustomButton(
              text: 'search',
              onTap: () => Get.to(
                () => const SearchResultsScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
