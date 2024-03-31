import '../../../../core/imports/core_imports.dart';

class DottedVerticalDivider extends StatelessWidget {
  const DottedVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          (24.h / (2.w * 2)).floor(),
          (index) => Container(
            width: 2.w,
            height: 5.h,
            margin: EdgeInsets.only(
              bottom: 4.h,
            ),
            decoration: BoxDecoration(
              color: CustomColors.grayDark,
              borderRadius: BorderRadius.circular(
                2.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
