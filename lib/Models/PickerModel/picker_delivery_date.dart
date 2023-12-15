// To parse this JSON data, do
//
//     final deliveryDateList = deliveryDateListFromJson(jsonString);

import 'dart:convert';

DeliveryDateList deliveryDateListFromJson(String str) => DeliveryDateList.fromJson(json.decode(str));

String deliveryDateListToJson(DeliveryDateList data) => json.encode(data.toJson());

class DeliveryDateList {
  bool status;
  List<DateTime> data;
  String message;

  DeliveryDateList({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeliveryDateList.fromJson(Map<String, dynamic> json) => DeliveryDateList(
    status: json["status"],
    data: List<DateTime>.from(json["data"].map((x) => DateTime.parse(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
    "message": message,
  };
}
