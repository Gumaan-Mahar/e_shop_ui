import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/legal_screen.dart';

class BuyerProtectionScreen extends StatelessWidget {
  const BuyerProtectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:LegalScreen(title: "Buyer's Protection".tr, text: 'By accessing and using [Your E-commerce App Name], you agree to abide by these Terms and Conditions effective from [Insert Date]. Use the app responsibly, maintaining the confidentiality of your account information. Product details are for informational purposes, and we reserve the right to modify or discontinue products. Placing an order indicates your intent to purchase, and we may refuse or cancel orders. Ensure accurate and current payment information, as transactions are processed securely. Return and refund policies are outlined separately. Respect our intellectual property rights, and we are not liable for indirect damages. We may modify these terms, with changes effective upon posting. Governed by the laws of [Your Jurisdiction], any questions can be directed to [your contact information].')
    );
  }
}