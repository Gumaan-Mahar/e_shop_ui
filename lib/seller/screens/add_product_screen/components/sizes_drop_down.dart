import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

class SizesDropdownButton<String> extends StatelessWidget {
  final double width;
  final RxString value;
  final List<String> items;
  final List<String> excludeValues;
  final void Function(dynamic)? onChanged;

  const SizesDropdownButton({
    super.key,
    required this.width,
    required this.value,
    required this.items,
    required this.excludeValues,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.h,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.w,
            ),
            border: Border.all(color: CustomColors.borderColor),
          ),
          child: Center(
            child: Obx(
              () => DropdownButton<dynamic>(
                style: globalTextStyle(
                  fontSize: 16.sp,
                  color: CustomColors.primary,
                ),
                value: value.value,
                items: items
                    .where((item) => !excludeValues.contains(item))
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item!,
                        child: Text(
                          item.toString(),
                          style: globalTextStyle(
                            fontSize: 14.sp,
                            color: CustomColors.primary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (newVal) {
                  value.value = newVal!.toString();
                  onChanged!(newVal);
                },
                underline: const SizedBox.shrink(),
                icon: Icon(
                  FlutterRemix.arrow_drop_down_line,
                  size: 28.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
