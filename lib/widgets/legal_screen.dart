import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';

class LegalScreen extends StatelessWidget {
  final String title;
  final String text;
  const LegalScreen({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackButton: true,
        title: title.tr,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: globalTextStyle(
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
