import 'package:e_shop_ui/core/imports/packages_imports.dart';

import '../../../../core/imports/core_imports.dart';

class AddImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddImageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: CustomColors.secondary,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          boxShadow: [
            BoxShadow(
              color: CustomColors.grayDark.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            FlutterRemix.image_add_line,
            size: 28.w,
            color: CustomColors.grayDark,
          ),
        ),
      ),
    );
  }
}
