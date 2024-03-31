import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/helpers/reg_expressions.dart';

import '../core/imports/core_imports.dart';

class CustomOutlinedTextField extends StatelessWidget {
  final bool? disabled;
  final String? label;
  final Color? labelColor;
  final String hintText;
  final int? maxlines;
  final String? initalValue;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  const CustomOutlinedTextField({
    super.key,
    this.disabled = false,
    this.label,
    this.labelColor,
    required this.hintText,
    this.maxlines = 1,
    required this.textEditingController,
    this.keyboardType,
    required this.validator,
    this.initalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: label == null ? 0 : 24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!.tr,
              textAlign: TextAlign.start,
              style: globalTextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: labelColor ?? Colors.black54,
              ),
            ),
          if (label != null)
            SizedBox(
              height: 8.h,
            ),
          TextFormField(
            enabled: !disabled!,
            controller: textEditingController,
            initialValue: initalValue,
            maxLines: maxlines,
            style: globalTextStyle(
              fontSize: 13.sp,
              color: (disabled != null && disabled == true)
                  ? CustomColors.grayLight
                  : CustomColors.grayDark,
            ),
            keyboardType: keyboardType ?? TextInputType.text,
            validator: validator,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExpressions.onlyLettersNumbersWithSpace,
              ),
            ],
            decoration: InputDecoration(
              errorStyle: globalTextStyle(
                fontSize: 12.sp,
                color: (disabled != null && disabled == true)
                    ? CustomColors.grayLight
                    : CustomColors.red,
              ),
              hintText: hintText.tr,
              hintStyle: globalTextStyle(
                fontSize: 12.sp,
                color: (disabled != null && disabled == true)
                    ? CustomColors.grayLight
                    : CustomColors.grayDark.withOpacity(
                        0.8,
                      ),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColors.grayDark,
                ),
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColors.grayDark,
                ),
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColors.primary,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColors.grayLight,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: (disabled != null && disabled == true)
                      ? CustomColors.grayLight
                      : CustomColors.red,
                ),
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: CustomColors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
