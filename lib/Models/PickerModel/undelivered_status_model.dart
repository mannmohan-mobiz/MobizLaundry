// To parse this JSON data, do
//
//     final pickerUndeliveredStatusModel = pickerUndeliveredStatusModelFromJson(jsonString);

import 'dart:convert';

PickerUndeliveredStatusModel pickerUndeliveredStatusModelFromJson(String str) => PickerUndeliveredStatusModel.fromJson(json.decode(str));

String pickerUndeliveredStatusModelToJson(PickerUndeliveredStatusModel data) => json.encode(data.toJson());

class PickerUndeliveredStatusModel {
  bool status;
  UndeliveredStatus data;
  String message;

  PickerUndeliveredStatusModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerUndeliveredStatusModel.fromJson(Map<String, dynamic> json) => PickerUndeliveredStatusModel(
    status: json["status"],
    data: UndeliveredStatus.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class UndeliveredStatus {
  String orderId;
  String orderNumber;
  String totalAmount;
  String status;
  String orderType;
  DateTime orderDate;

  UndeliveredStatus({
    required this.orderId,
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
    required this.orderType,
    required this.orderDate,
  });

  factory UndeliveredStatus.fromJson(Map<String, dynamic> json) => UndeliveredStatus(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    totalAmount: json["total_amount"],
    status: json["status"],
    orderType: json["order_type"],
    orderDate: DateTime.parse(json["order_date"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "total_amount": totalAmount,
    "status": status,
    "order_type": orderType,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
  };
}
