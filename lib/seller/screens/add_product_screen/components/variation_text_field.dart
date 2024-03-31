import '../../../../core/imports/core_imports.dart';

class VariationTextField extends StatelessWidget {
  final String? initialValue;
  final String hintText;
  final Function(String)? onChanged;

  const VariationTextField({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: TextInputType.phone,
        style: globalTextStyle(
          fontSize: 14.sp,
        ),
        onChanged: onChanged,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: globalTextStyle(
            fontSize: 14.sp,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
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
            borderSide: const BorderSide(
              color: CustomColors.red,
            ),
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
        ),
      ),
    );
  }
}
