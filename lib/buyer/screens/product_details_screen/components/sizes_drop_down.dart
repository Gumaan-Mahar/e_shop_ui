import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

class SizesDropDown extends StatelessWidget {
  final RxString selectedSize;
  final List<String> sizes;
  final void Function(String?)? onChanged;

  const SizesDropDown({
    super.key,
    required this.selectedSize,
    required this.sizes,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Obx(
        () => ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            style: globalTextStyle(
              fontSize: 16.sp,
              color: CustomColors.primary,
            ),
            value: selectedSize.value,
            decoration: InputDecoration(
              labelText: 'Size'.tr,
              labelStyle: globalTextStyle(
                fontSize: 12.sp,
                color: CustomColors.primary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColors.primaryLight,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColors.primaryLight,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColors.primaryLight,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: CustomColors.primaryLight,
                ),
              ),
              contentPadding: EdgeInsets.zero,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            items: sizes
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: globalTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (newVal) {
              selectedSize.value = newVal!;
              if (onChanged != null) {
                onChanged!(newVal);
              }
            },
            icon: Icon(
              FlutterRemix.arrow_drop_down_line,
              size: 28.w,
            ),
          ),
        ),
      ),
    );
  }
}
