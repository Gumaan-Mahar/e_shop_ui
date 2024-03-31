import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

import '../core/imports/core_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final Color? color;
  final bool hasBackButton;
  final List<Widget> actions;
  final double? elevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.color,
    this.subTitle,
    required this.hasBackButton,
    this.elevation,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? CustomColors.secondary,
      centerTitle: true,
      elevation: elevation ?? 1,
      shadowColor: Colors.black,
      leading: hasBackButton
          ? IconButton(
              icon: Icon(
                Get.locale == const Locale('ur')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
                color: Colors.black54,
                size: 24.h,
              ),
              onPressed: () => Get.back(),
            )
          : null,
      iconTheme: const IconThemeData(
        color: CustomColors.primary,
      ),
      title: Column(
        children: [
          Text(
            title.tr,
            style: globalTextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subTitle != null)
            Text(
              subTitle!.tr,
              style: globalTextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}
