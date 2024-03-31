import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

import '../core/imports/core_imports.dart';

class CustomDropdownButton<String> extends StatelessWidget {
  final double width;
  final RxString value;
  final List<String> items;
  final void Function(dynamic)? onChanged;

  const CustomDropdownButton({
    super.key,
    required this.width,
    required this.value,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 44.h,
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
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item!,
                        child: Text(
                          item.toString().tr,
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
                  onChanged?.call(newVal);
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
