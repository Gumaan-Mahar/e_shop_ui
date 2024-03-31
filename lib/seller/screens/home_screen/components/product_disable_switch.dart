import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/imports/core_imports.dart';

class ProductDisableSwitch extends StatelessWidget {
  final RxBool isSwitched = false.obs;

  ProductDisableSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Transform.scale(
        scale: 0.8,
        child: CupertinoSwitch(
          value: isSwitched.value,
          onChanged: (value) {
            isSwitched.value = value;
          },
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
