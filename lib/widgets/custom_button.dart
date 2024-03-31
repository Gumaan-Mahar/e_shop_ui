import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final String text;
  final Color? textColor;
  final IconData? icon;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;
  final Color? borderColor;
  final Color? iconColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final void Function()? onTap;

  const CustomButton({
    super.key,
    this.onTap,
    this.height,
    this.borderColor,
    this.width,
    this.color,
    this.borderRadius,
    required this.text,
    this.textColor,
    this.icon,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.iconColor,
    this.fontWeight,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height ?? 45.h,
        width: width ?? Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? CustomColors.primary,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
          border: Border.all(
            color: borderColor ?? CustomColors.primary,
            width: 1.w,
          ),
        ),
        margin: EdgeInsets.only(
            bottom: marginBottom ?? 0,
            top: marginTop ?? 0,
            left: marginLeft ?? 0,
            right: marginRight ?? 0),
        child: icon == null
            ? Text(
                text.tr,
                style: globalTextStyle(
                  fontSize: textSize ?? 16.sp,
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  letterSpacing: 1,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: iconColor ?? CustomColors.primary),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    text.tr,
                    style: globalTextStyle(
                      fontSize: textSize ?? 16.sp,
                      color: textColor ?? Colors.white,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
