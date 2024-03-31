import 'package:get/get.dart';
import 'package:e_shop_ui/common/models/user_model.dart';

String formatAddress(AddressModel address) =>
    "${address.area}, ${address.block}, ${address.street}, ${address.avenue}, ${address.building}, ${address.floor}, ${address.apartment},  ${address.goverorate}"
        .capitalize!;
