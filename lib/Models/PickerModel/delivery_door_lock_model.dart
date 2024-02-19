// To parse this JSON data, do
//
//     final deliveryDoorLockModel = deliveryDoorLockModelFromJson(jsonString);

import 'dart:convert';

DeliveryDoorLockModel deliveryDoorLockModelFromJson(String str) => DeliveryDoorLockModel.fromJson(json.decode(str));

String deliveryDoorLockModelToJson(DeliveryDoorLockModel data) => json.encode(data.toJson());

class DeliveryDoorLockModel {
  bool status;
  List<DeliveryDoorLock> data;
  String message;

  DeliveryDoorLockModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveryDoorLockModel.fromJson(Map<String, dynamic> json) => DeliveryDoorLockModel(
    status: json["status"],
    data: List<DeliveryDoorLock>.from(json["data"].map((x) => DeliveryDoorLock.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DeliveryDoorLock {
  String orderNumber;
  String orderType;
  String staffName;
  String deliveryTime;
  DateTime deliveryDate;
  String status;

  DeliveryDoorLock({
    required this.orderNumber,
    required this.orderType,
    required this.staffName,
    required this.deliveryTime,
    required this.deliveryDate,
    required this.status,
  });

  factory DeliveryDoorLock.fromJson(Map<String, dynamic> json) => DeliveryDoorLock(
    orderNumber: json["order_number"],
    orderType: json["order_type"],
    staffName: json["staff__name"],
    deliveryTime: json["Delivery_time"],
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "order_number": orderNumber,
    "order_type": orderType,
    "staff__name": staffName,
    "Delivery_time": deliveryTime,
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
