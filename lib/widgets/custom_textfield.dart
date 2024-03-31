import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/helpers/reg_expressions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.height,
    this.width,
    this.keyboardType,
    required this.controller,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 35.h,
      width: width ?? Get.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: CustomColors.gray,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        textAlign: TextAlign.start,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        style: globalTextStyle(fontSize: 12.sp),
        autofocus: true,
        inputFormatters: inputFormatters ??
            [
              FilteringTextInputFormatter.allow(
                RegExpressions.onlyLettersNumbersWithSpace,
              ),
            ],
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: globalTextStyle(
            fontSize: 12.sp,
            color: CustomColors.primaryDark.withOpacity(0.5),
          ),
          errorStyle: globalTextStyle(
            fontSize: 11.sp,
            color: CustomColors.red,
          ),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
