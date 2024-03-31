import 'package:date_format/date_format.dart';
import 'package:get/get.dart';

import '../models/order_model.dart';
import '../models/order_type_model.dart';

class OrderScreenController extends GetxController {
  final RxString selectedOrderType = 'all'.obs;
  final List<String> statuses = ['process', 'shipped', 'cancelled'];

  String formatDateTime(DateTime dateTime) {
    return formatDate(
        dateTime, [h, ':', nn, ' ', am, '  ', d, ' ', MM, ' ', yyyy]);
  }

  final List<OrderTypeModel> orderTypes = [
    OrderTypeModel(
      orderName: 'all',
      orderQuantity: 45,
    ),
    OrderTypeModel(
      orderName: 'process',
      orderQuantity: 10,
    ),
    OrderTypeModel(
      orderName: 'shipped',
      orderQuantity: 30,
    ),
    OrderTypeModel(
      orderName: 'cancelled',
      orderQuantity: 5,
    ),
  ];

  List<OrderModel> allOrders = [
    OrderModel(
      orderId: 342311,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '123 Main St, Cityville',
      subTotal: 100.00,
      codeApplied: 'CODE123',
      discount: 10,
      deliveryCharges: 5.0,
      paymentMethod: 'Credit Card',
    ),
    OrderModel(
      orderId: 234231,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '456 Oak St, Townsville',
      subTotal: 75.0,
      codeApplied: 'NOCODE',
      discount: 0,
      deliveryCharges: 3.0,
      paymentMethod: 'PayPal',
    ),
    OrderModel(
      orderId: 334231,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '789 Pine St, Villageland',
      subTotal: 50.0,
      codeApplied: 'CODE456',
      discount: 8,
      deliveryCharges: 4.0,
      paymentMethod: 'Cash on Delivery',
    ),
  ];

  List<OrderModel> processOrders = [
    OrderModel(
      orderId: 434231,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '101 Cedar St, Hamletville',
      subTotal: 120.0,
      codeApplied: 'CANCELLED',
      discount: 15,
      deliveryCharges: 6.0,
      paymentMethod: 'Credit Card',
    ),
    OrderModel(
      orderId: 534231,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '202 Oak St, Townsville',
      subTotal: 90.0,
      codeApplied: 'DISCOUNT5',
      discount: 5,
      deliveryCharges: 2.0,
      paymentMethod: 'Cash on Delivery',
    ),
  ];

  List<OrderModel> shippedOrders = [
    OrderModel(
      orderId: 734231,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '404 Main St, Cityville',
      subTotal: 60.0,
      codeApplied: 'SHIPPEDFREE',
      discount: 0,
      deliveryCharges: 0.0,
      paymentMethod: 'Credit Card',
    ),
  ];

  List<OrderModel> cancelledOrders = [
    OrderModel(
      orderId: 1034231,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '707 Pine St, Villageland',
      subTotal: 70.0,
      codeApplied: 'CANCELLED10',
      discount: 10,
      deliveryCharges: 4.0,
      paymentMethod: 'Credit Card',
    ),
    OrderModel(
      orderId: 1134231,
      orderedDate: DateTime.parse("2023-01-15 10:30:00"),
      outForDeliveryDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveredDate: DateTime.parse("2023-01-15 10:30:00"),
      deliveryAddress: '808 Cedar St, Hamletville',
      subTotal: 85.0,
      codeApplied: 'CANCELLEDFREE',
      discount: 0,
      deliveryCharges: 0.0,
      paymentMethod: 'PayPal',
    ),
  ];
}
