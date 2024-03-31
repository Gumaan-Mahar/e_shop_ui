import 'package:get/get.dart';

import '../../../../core/imports/core_imports.dart';

class BottomSheetListTile extends StatelessWidget {
  final String title;
  final Widget suffix;
  final VoidCallback onPressed;
  const BottomSheetListTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title.tr,
                    style: globalTextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  suffix,
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: CustomColors.borderColor,
            ),
          ],
        ),
      ),
    );
  }
}
