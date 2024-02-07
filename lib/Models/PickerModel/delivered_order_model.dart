// To parse this JSON data, do
//
//     final deliveredOrderModel = deliveredOrderModelFromJson(jsonString);

import 'dart:convert';

DeliveredOrderModel deliveredOrderModelFromJson(String str) => DeliveredOrderModel.fromJson(json.decode(str));

String deliveredOrderModelToJson(DeliveredOrderModel data) => json.encode(data.toJson());

class DeliveredOrderModel {
  bool status;
  List<DeliveredOrder> data;
  String message;

  DeliveredOrderModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveredOrderModel.fromJson(Map<String, dynamic> json) => DeliveredOrderModel(
    status: json["status"],
    data: List<DeliveredOrder>.from(json["data"].map((x) => DeliveredOrder.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DeliveredOrder {
  String mobile;
  String orderId;
  String orderNumber;
  String totalAmount;
  DateTime deliveryDate;
  String deliveryTime;
  String status;
  CustomerAddress customerAddress;
  int noOfItems;
  String customer;
  String amountPaid;
  int balanceAmount;

  DeliveredOrder({
    required this.mobile,
    required this.orderId,
    required this.orderNumber,
    required this.totalAmount,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.status,
    required this.customerAddress,
    required this.noOfItems,
    required this.customer,
    required this.amountPaid,
    required this.balanceAmount,
  });

  factory DeliveredOrder.fromJson(Map<String, dynamic> json) => DeliveredOrder(
    mobile: json["mobile"],
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
    status: json["status"],
    customerAddress: CustomerAddress.fromJson(json["customer_address"]),
    noOfItems: json["no_of_items"],
    customer: json["customer"],
    amountPaid: json["amount_paid"],
    balanceAmount: json["balance_amount"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "order_id": orderId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "status": status,
    "customer_address": customerAddress.toJson(),
    "no_of_items": noOfItems,
    "customer": customer,
    "amount_paid": amountPaid,
    "balance_amount": balanceAmount,
  };
}

class CustomerAddress {
  String name;
  String customerType;
  String buildingNo;
  String roomNo;
  String buildingName;
  String floorNumber;
  String flatNumber;

  CustomerAddress({
    required this.name,
    required this.customerType,
    required this.buildingNo,
    required this.roomNo,
    required this.buildingName,
    required this.floorNumber,
    required this.flatNumber,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) => CustomerAddress(
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
  };
}
