import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final bool hasBackButton;
  final void Function() onTap;
  final Widget? leading;
  final Widget? trailing;
  final String? subtitle;
  final Widget? subtitleWidget;
  const CustomListTile(
      {super.key,
      required this.title,
      required this.hasBackButton,
      required this.onTap,
      this.leading,
      this.trailing,
      this.subtitle,
      this.subtitleWidget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      title: Text(
        title.tr,
        style: globalTextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      leading: leading,
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!.tr,
              style: globalTextStyle(fontSize: 12.sp),
            ),
      trailing: hasBackButton
          ? IconButton(
              icon: Icon(
                Get.locale == const Locale('en_US')
                    ? FlutterRemix.arrow_right_s_line
                    : FlutterRemix.arrow_left_s_line,
                color: CustomColors.grayDark,
              ),
              onPressed: () => Get.back(),
            )
          : null,
    );
  }
}
