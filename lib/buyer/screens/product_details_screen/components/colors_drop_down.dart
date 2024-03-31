import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/helpers/get_color.dart';

class ColorsDropDown extends StatelessWidget {
  final RxString selectedColor;
  final List<String> colors;
  final void Function(String?)? onChanged;

  const ColorsDropDown({
    super.key,
    required this.selectedColor,
    required this.colors,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Obx(
        () => ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            value: selectedColor.value,
            decoration: InputDecoration(
              labelText: 'Color'.tr,
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
            items: colors
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: HexColor(item),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (newVal) {
              selectedColor.value = newVal!;
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
