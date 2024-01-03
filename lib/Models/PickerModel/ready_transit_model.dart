// To parse this JSON data, do
//
//     final pickerReadyTransitModel = pickerReadyTransitModelFromJson(jsonString);

import 'dart:convert';

PickerReadyTransitModel pickerReadyTransitModelFromJson(String str) => PickerReadyTransitModel.fromJson(json.decode(str));

String pickerReadyTransitModelToJson(PickerReadyTransitModel data) => json.encode(data.toJson());

class PickerReadyTransitModel {
  bool status;
  ReadyTransit data;
  String message;

  PickerReadyTransitModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PickerReadyTransitModel.fromJson(Map<String, dynamic> json) => PickerReadyTransitModel(
    status: json["status"],
    data: ReadyTransit.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class ReadyTransit {
  String orderId;
  String orderNumber;
  String totalAmount;
  String status;
  String orderType;
  DateTime orderDate;

  ReadyTransit({
    required this.orderId,
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
    required this.orderType,
    required this.orderDate,
  });

  factory ReadyTransit.fromJson(Map<String, dynamic> json) => ReadyTransit(
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
