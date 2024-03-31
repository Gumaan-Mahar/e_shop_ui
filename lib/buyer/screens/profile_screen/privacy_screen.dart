import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/legal_screen.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LegalScreen(
            title: 'Privacy & Policey'.tr,
            text:
                'Welcome to [Your E-commerce App Name]! This Privacy Policy, effective from [Insert Date], outlines our commitment to safeguarding your personal information. We collect data such as name, contact details, and usage information to process orders, improve services, and communicate updates. Your information is not sold, but may be shared with trusted third parties assisting in app operations. Security measures are in place, and we use cookies for an enhanced user experience. You have the choice to limit information provided, and any changes to this policy will be updated here. If you have questions, reach out to us at [your contact information].'));
  }
}
