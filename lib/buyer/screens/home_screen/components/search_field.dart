import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

import '../../search_screen/search_screen.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      enabled: true,
      onTap: () => Get.to(() => const SearchScreen()),
      decoration: InputDecoration(
        suffixIcon: const Icon(FlutterRemix.search_line),
        hintText: 'Search anything'.tr,
        hintStyle: globalTextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          // color: CustomColors.primary,
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: CustomColors.grayDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: CustomColors.grayDark,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: CustomColors.grayDark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: CustomColors.grayDark,
          ),
        ),
      ),
    );
  }
}
