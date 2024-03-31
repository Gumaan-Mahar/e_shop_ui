import 'package:get/get.dart';

import '../core/imports/core_imports.dart';

class CustomTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;

  const CustomTopBar({
    super.key,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.secondary,
      elevation: 1,
      leadingWidth: Get.width,
      shadowColor: Colors.black,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.tr,
              style: globalTextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      actions: action == null
          ? []
          : [
              action!,
            ],
    );
  }

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}
